//
//  SplashViewController.h
//  Rehberim
//
//  Created by Most Wanted on 26/04/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "CityHelper.h"

@interface SplashViewController : UIViewController < CityHelperDelegate >

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicatorView;
@property (strong, nonatomic) NSArray *allList;

@end
