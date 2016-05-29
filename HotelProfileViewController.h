//
//  HotelProfileViewController.h
//  Rehberim
//
//  Created by Most Wanted on 27/04/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import <MapKit/MapKit.h>
#import "InsideCategoryObjects.h"
#import <CoreLocation/CoreLocation.h>

@interface HotelProfileViewController : BaseViewController <MKMapViewDelegate, CLLocationManagerDelegate, MKOverlay, UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *hotelImageView;
@property (weak, nonatomic) IBOutlet UITextView *hotelDescriptionTextView;
@property (weak, nonatomic) IBOutlet MKMapView *hotelMapView;
@property (strong, nonatomic) InsideCategoryObjects *insideObject;
@property (weak, nonatomic) IBOutlet UILabel *hotelNameLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicatorView;
@property (weak, nonatomic) IBOutlet UIButton *phoneNumber;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControler;

- (IBAction)phoneNumber:(UIButton *)sender;


-(instancetype)initWithInsideCategoryObject:(InsideCategoryObjects*)object;

@end
