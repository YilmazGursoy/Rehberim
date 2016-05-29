//
//  CityServer.h
//  Rehberim
//
//  Created by Most Wanted on 27/04/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Server.h"

@protocol CityServerDelegate <NSObject>

@required

-(void)getAllCitiesRequestSucceed:(NSArray*)allList;

@end


@interface CityServer : Server <CityServerDelegate>

@property (strong, nonatomic) id<CityServerDelegate> delegate;

-(void)sendRequestToGetAllCities;

-(instancetype)initWithDelegate:(id<CityServerDelegate>)delegate;

@end
