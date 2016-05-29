//
//  InsideCategoryObjects.h
//  Rehberim
//
//  Created by Most Wanted on 27/04/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface InsideCategoryObjects : NSObject

@property (strong, nonatomic) NSString *categoryInsideName;

@property (strong, nonatomic) PFFile *categoryInsideImage;

@property (nonatomic) int categoryInsideStarNumber;

@property (strong, nonatomic) NSString *categoryInsideDesc;

@property ( nonatomic) double latitude;

@property ( nonatomic) double longitude;

@property (strong, nonatomic) NSString *phoneNumber;

+(InsideCategoryObjects*)getInsideCategoryObjectWithHotelName:(NSString*)hotelName andHotelImage:(PFFile*)hotelImage andHotelDesciption:(NSString*)hotelDesc andHotelStarNumber:(int)hotelStarNumber andlongitude:(double)longitude andLatitude:(double)latitude andPhoneNumber:(NSString*)phoneNumber;

@end
