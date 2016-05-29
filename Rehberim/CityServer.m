//
//  CityServer.m
//  Rehberim
//
//  Created by Most Wanted on 27/04/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import "CityServer.h"

@implementation CityServer

-(instancetype)initWithDelegate:(id<CityServerDelegate>)delegate{

    if( self ) {
        self.delegate = delegate;
        [self sendRequestToGetAllCities];
    }

    return self;
}


-(void)sendRequestToGetAllCities {

    PFQuery *query = [PFQuery queryWithClassName:@"Cities"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        
        if( !error ) {
            
            [self.delegate getAllCitiesRequestSucceed:objects];
            
        } else {
        
            NSLog(@"Error ---- -(void)sendRequestToGetAllCities");
        
        }
        
    }];
}

@end
