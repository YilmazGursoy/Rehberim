//
//  InsideCategoryHelper.m
//  Rehberim
//
//  Created by Most Wanted on 27/04/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import "InsideCategoryHelper.h"
#import "InsideCategoryObjects.h"

@implementation InsideCategoryHelper

-(instancetype)initWithDelegate:(id<InsideCategoryDelegate>)delegate {

    if( self ) {
    
        self.delegate = delegate;
        [self sendInsideCategoryRequest];
    }

    return self;
}


-(void)sendInsideCategoryRequest{

    InsideCategoryServer *server = [[InsideCategoryServer alloc] initWithDelegate:self];
    
}

-(void)getAllInsideCategoryRequestSucceed:(NSArray *)allList{
    NSMutableArray *allInsideCategories = [[NSMutableArray alloc]init];
    if( allList.count > 0 ) {
        
        for( NSDictionary *dictionary in allList ) {
            
            [allInsideCategories addObject:[InsideCategoryObjects getInsideCategoryObjectWithHotelName:dictionary[@"otelIsmi"] andHotelImage:dictionary[@"otelResmi"] andHotelDesciption:dictionary[@"otelAciklamasi"] andHotelStarNumber:[dictionary[@"otelYildizSayisi"] intValue] andlongitude:[dictionary[@"longitude"] doubleValue] andLatitude:[dictionary[@"latitude"] doubleValue] andPhoneNumber:dictionary[@"telefonNumarasi"]]];
        
        }
        
        [self.delegate getAllInsideCategoriesObject:allInsideCategories];
    
    }else {
    
        NSLog(@"Error --- ListArrayObject.count <= 0 ---- -(void)getAllInsideCategoryRequestSucceed:(NSArray *)allList");
    
    }

}


@end
