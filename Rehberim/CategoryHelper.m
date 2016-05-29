//
//  CategoryHelper.m
//  Rehberim
//
//  Created by Most Wanted on 28/04/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import "CategoryHelper.h"

@implementation CategoryHelper

-(instancetype)initWithDelegate:(id<CategoryHelperDelegate>)delegate {
    
    if( self ) {
        
        self.delegate = delegate;
        [self sendInsideCategoryRequest];
    }
    
    return self;
}


-(void)sendInsideCategoryRequest{
    
    CategoryServer *server = [[CategoryServer alloc] initWithDelegate:self];
    
}

-(void)getAllCategoryRequestSucceed:(NSArray *)allList{
    NSMutableArray *allInsideCategories = [[NSMutableArray alloc]init];
    if( allList.count > 0 ) {
        
        for( NSDictionary *dictionary in allList ) {
            
            [allInsideCategories addObject:[CategoryObject getCategory:dictionary[@"categoryName"] andCategoryImage:dictionary[@"categoryImage"]]];
            
        }
        
        [self.delegate getAllCategoriesObject:allInsideCategories];
        
    } else {
    
        NSLog(@"Error --- ListArrayObject.count <= 0 ---- -(void)getAllCategoryRequestSucceed:(NSArray *)allList");
    
    }
    
}


@end
