//
//  CategoryObject.h
//  Rehberim
//
//  Created by Most Wanted on 27/04/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface CategoryObject : NSObject

@property (strong, nonatomic) NSString *categoryName;

@property (strong, nonatomic) PFFile *categoryImage;

+(CategoryObject*)getCategory:(NSString*)categoryName andCategoryImage:(PFFile*)categoryImage;

@end
