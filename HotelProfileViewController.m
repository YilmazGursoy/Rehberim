//
//  HotelProfileViewController.m
//  Rehberim
//
//  Created by Most Wanted on 27/04/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import "HotelProfileViewController.h"
#import "HotelProfileViewController+MapView.h"
#import "Server.h"




@interface HotelProfileViewController ()

@end

@implementation HotelProfileViewController

-(instancetype)initWithInsideCategoryObject:(InsideCategoryObjects *)object{

    if( self ) {
    
        self.insideObject = object;
        
    }
    
    return self;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupAndCreateUI];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)backButtonPressed:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:true];

}

#pragma mark - HelperMethods


- (IBAction)phoneNumber:(UIButton *)sender {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",sender.currentTitle]]];
    
}

-(void)setupAndCreateUI{

    [self.indicatorView startAnimating];
    
    self.hotelDescriptionTextView.text = self.insideObject.categoryInsideDesc;
    self.hotelNameLabel.text = self.insideObject.categoryInsideName;
    
    [self setupStarImage:self.insideObject.categoryInsideStarNumber];
    
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.delegate = self;
    
    UIImageView *p1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
    [p1 setImage:[UIImage imageNamed:@"room1"]];
    
    UIImageView *p2 = [[UIImageView alloc] initWithFrame:CGRectMake(self.scrollView.frame.size.width, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
    [p2 setImage:[UIImage imageNamed:@"room2"]];
    
    UIImageView *p3 = [[UIImageView alloc] initWithFrame:CGRectMake(2 * self.scrollView.frame.size.width, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
    [p3 setImage:[UIImage imageNamed:@"room3"]];
    
    [self.scrollView addSubview:p1];
    [self.scrollView addSubview:p2];
    [self.scrollView addSubview:p3];
    
    self.scrollView.contentSize = CGSizeMake(3 * self.scrollView.frame.size.width, self.scrollView.frame.size.height);
    
    
    self.pageControler.numberOfPages = 3;
    
    [self.phoneNumber setTitle:self.insideObject.phoneNumber forState:UIControlStateNormal];
    
    [self setupHotelImageViewWithDispatch];
    
}

-(void)setupHotelImageViewWithDispatch{

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{ // 1
        
        
        UIImage *cityImage = [Server getImageFromParseBackend:self.insideObject.categoryInsideImage.url
                              ];
        dispatch_async(dispatch_get_main_queue(), ^{ // 2
            
            [self.hotelImageView setImage:cityImage];
            [self.indicatorView setHidden:true];
            [self.indicatorView stopAnimating];
            
        });
        
    });
    
    [self.hotelNameLabel setText:self.insideObject.categoryInsideName];
    
    [self setupAndCreateMapView];
    
}

#pragma mark - ScrollViewDelegate

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    if( scrollView == self.scrollView ) {
            
        int page = scrollView.contentOffset.x / scrollView.frame.size.width;
        
        [self.pageControler setCurrentPage:page];
        
    }
}



@end
