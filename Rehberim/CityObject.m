//
//  CityObject.m
//  Rehberim
//
//  Created by Most Wanted on 27/04/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import "CityObject.h"

@implementation CityObject

+(CityObject*)getCityObjectWithName:(NSString *)cityName andImage:(UIImage*)cityImage{
    
    CityObject *object = [[CityObject alloc]init];
    
    object.cityName = cityName;
    
    object.cityImage = cityImage;
    
    return object;

}

@end
