//
//  CitiesPageViewController.h
//  Rehberim
//
//  Created by Most Wanted on 27/04/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface CitiesPageViewController : BaseViewController  <UIPageViewControllerDataSource>

@property (strong, nonatomic) UIPageViewController *pageController;

@property (strong, nonatomic) NSArray *cityObjects;


-(instancetype)initWithCityObjects:(NSArray*)cityObjects;
@end
