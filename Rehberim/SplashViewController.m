//
//  SplashViewController.m
//  Rehberim
//
//  Created by Most Wanted on 26/04/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import "SplashViewController.h"
#import "CitiesPageViewController.h"


@interface SplashViewController ()

@end

@implementation SplashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.indicatorView startAnimating];
    CityHelper *helperForRequest = [[CityHelper alloc]initWithDelegate:self];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)pushViewController{
    
    CitiesPageViewController *vc = [[CitiesPageViewController alloc] initWithCityObjects:self.allList];
    
    [self.navigationController pushViewController:vc animated:true];

}

-(void)getAllCitiesObject:(NSArray *)citiesObject{

    self.allList = citiesObject;
    [self pushViewController];
}

@end
