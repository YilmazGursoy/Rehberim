//
//  CityHelper.m
//  Rehberim
//
//  Created by Most Wanted on 27/04/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import "CityHelper.h"
#import "CityObject.h"
#import "CityServer.h"


@implementation CityHelper


-(instancetype)initWithDelegate:(id<CityHelperDelegate>)delegate{

    if( self ) {
    
        self.delegate = delegate;
        [self sendCitiesRequest];
        
    }
    
    return self;
}

-(void)sendCitiesRequest{

    self.serverObject = [[CityServer alloc] initWithDelegate:self];
    
}

-(void)getAllCitiesRequestSucceed:(NSArray *)allList{
    
    NSMutableArray *allMutableList = [[NSMutableArray alloc]init];
    
    if( allList.count > 0 ) {
        
        for ( NSDictionary *dictionary in allList ) {
            
            PFFile *imageFile = dictionary[@"cityImage"];
            
            UIImage *cityImage = [CityServer getImageFromParseBackend:imageFile.url];
            
            [allMutableList addObject:[CityObject getCityObjectWithName:dictionary[@"cityName"] andImage:cityImage]];
            
        }
        
    }
    
    [self.delegate getAllCitiesObject:allMutableList];

}






@end
