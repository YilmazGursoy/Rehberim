//
//  CityObject.h
//  Rehberim
//
//  Created by Most Wanted on 27/04/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CityObject : NSObject

@property (strong, nonatomic) NSString *cityName;
@property (strong, nonatomic) UIImage *cityImage;


+(CityObject*)getCityObjectWithName:(NSString *)cityName andImage:(UIImage*)cityImage;

@end
