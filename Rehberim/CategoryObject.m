//
//  CategoryObject.m
//  Rehberim
//
//  Created by Most Wanted on 27/04/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import "CategoryObject.h"

@implementation CategoryObject


+(CategoryObject*)getCategory:(NSString*)categoryName andCategoryImage:(PFFile*)categoryImage{
    
    CategoryObject *object = [[CategoryObject alloc]init];
    
    object.categoryName = categoryName;
    
    object.categoryImage = categoryImage;
    
    return object;
    
}


@end
