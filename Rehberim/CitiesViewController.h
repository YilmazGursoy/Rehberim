//
//  CitiesViewController.h
//  Rehberim
//
//  Created by Most Wanted on 27/04/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface CitiesViewController : BaseViewController

@property (strong, nonatomic) UIImage *cityImage;
@property (strong, nonatomic) NSString *cityName;
@property (strong, nonatomic) NSString *classID;
@property (assign, nonatomic) NSInteger index;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andCityName:(NSString*)cityName andCityImage:(UIImage*)cityImage andIndex:(int)index;

@end
