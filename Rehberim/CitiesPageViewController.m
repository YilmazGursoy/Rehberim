//
//  CitiesPageViewController.m
//  Rehberim
//
//  Created by Most Wanted on 27/04/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import "CitiesPageViewController.h"
#import "CitiesViewController.h"
#import "CityObject.h"

@interface CitiesPageViewController ()

@end

@implementation CitiesPageViewController

-(instancetype)initWithCityObjects:(NSArray*)cityObjects{
    
    if( self ) {
        self.cityObjects = cityObjects;
    }
    
    return  self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createAndSetupPageController];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



- (CitiesViewController *)viewControllerAtIndex:(NSUInteger)index {
    
    CityObject *cityObject = self.cityObjects[index];
    
    CitiesViewController *citiesViewController = [[CitiesViewController alloc] initWithNibName:@"CitiesViewController" bundle:nil andCityName:cityObject.cityName andCityImage:cityObject.cityImage andIndex:(int)index];
    
    return citiesViewController;
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(CitiesViewController *)viewController index];
    
    if (index == 0) {
        return nil;
    }
    
    index--;
    
    // Decrease the index by 1 to return
    
    return [self viewControllerAtIndex:index];
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(CitiesViewController *)viewController index];
    
    index++;
    
    if (index == self.cityObjects.count) {
        return nil;
    }
    
    return [self viewControllerAtIndex:index];
    
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    // The number of items reflected in the page indicator.
    return self.cityObjects.count;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    // The selected item reflected in the page indicator.
    return 0;
}


#pragma mark - Helper Methods 


-(void)createAndSetupPageController{

    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    self.pageController.dataSource = self;
    [[self.pageController view] setFrame:[[self view] bounds]];
    
    
    CitiesViewController *initialViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = [NSArray arrayWithObject:initialViewController];
    
    [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [self addChildViewController:self.pageController];
    [[self view] addSubview:[self.pageController view]];
    [self.pageController didMoveToParentViewController:self];

}


@end
