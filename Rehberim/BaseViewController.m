//
//  BaseViewController.m
//  Rehberim
//
//  Created by Most Wanted on 06/05/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)setupStarImage:(int)numberOfStar{
    
    NSArray *starImageViews = @[self.star1, self.star2, self.star3, self.star4, self.star5];
    
    for( int i = 0 ; i < numberOfStar; i ++ ) {
        
        [starImageViews[i] setImage:[UIImage imageNamed:@"1Star"]];
        
    }
    
}


@end
