
//
//  InsideCategoryServer.m
//  Rehberim
//
//  Created by Most Wanted on 27/04/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import "InsideCategoryServer.h"

@implementation InsideCategoryServer

-(instancetype)initWithDelegate:(id<InsideCategoryDelegate>)delegate{
    
    if( self ) {
        self.delegate = delegate;
        [self sendRequestToGetAllCategoryInsides];
    }
    
    return self;
}


-(void)sendRequestToGetAllCategoryInsides {
    
    PFQuery *query = [PFQuery queryWithClassName:@"Oteller"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        
        if( !error ) {
            
            [self.delegate getAllInsideCategoryRequestSucceed:objects];
            
        } else {
            
            NSLog(@"Error ---- -(void)sendRequestToGetAllCategoryInsides");
        
        }
        
    }];
    
}



@end
