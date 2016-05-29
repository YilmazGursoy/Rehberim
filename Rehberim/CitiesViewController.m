//
//  CitiesViewController.m
//  Rehberim
//
//  Created by Most Wanted on 27/04/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import "CitiesViewController.h"
#import "CategoriesViewController.h"

@interface CitiesViewController ()

@property (weak, nonatomic) IBOutlet UILabel *cityNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *cityImageView;
- (IBAction)goCityButtonPressed:(UIButton *)sender;

@end

@implementation CitiesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andCityName:(NSString*)cityName andCityImage:(UIImage*)cityImage andIndex:(int)index{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.cityName = cityName;
        self.cityImage = cityImage;
        self.index = index;
    }
    
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.cityNameLabel setText:self.cityName];
    [self.cityImageView setImage:self.cityImage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)goCityButtonPressed:(UIButton *)sender {
    
    CategoriesViewController *vc = [[CategoriesViewController alloc]init];
    
    [self.navigationController pushViewController:vc animated:true];
    
}
@end
