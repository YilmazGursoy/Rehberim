//
//  InsideCategoryObjects.m
//  Rehberim
//
//  Created by Most Wanted on 27/04/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import "InsideCategoryObjects.h"
#import <Parse/Parse.h>

@implementation InsideCategoryObjects

+(InsideCategoryObjects*)getInsideCategoryObjectWithHotelName:(NSString*)hotelName andHotelImage:(PFFile*)hotelImage andHotelDesciption:(NSString*)hotelDesc andHotelStarNumber:(int)hotelStarNumber andlongitude:(double)longitude andLatitude:(double)latitude andPhoneNumber:(NSString*)phoneNumber{

    InsideCategoryObjects *insideObject = [[InsideCategoryObjects alloc]init];
    
    insideObject.categoryInsideName = hotelName;
    
    insideObject.categoryInsideDesc = hotelDesc;
    
    insideObject.categoryInsideImage = hotelImage;
    
    insideObject.categoryInsideStarNumber = hotelStarNumber;
    
    insideObject.longitude = longitude;
    
    insideObject.latitude = latitude;
    
    insideObject.phoneNumber = phoneNumber;
    
    return insideObject;

}

@end
