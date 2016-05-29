//
//  CityHelper.h
//  Rehberim
//
//  Created by Most Wanted on 27/04/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CityServer.h"

@protocol CityHelperDelegate <NSObject>

@required


-(void)getAllCitiesObject:(NSArray*)citiesObject;


@end


@interface CityHelper : NSObject < CityServerDelegate , CityHelperDelegate>


@property (strong, nonatomic) CityServer *serverObject;


@property (strong, nonatomic) id<CityHelperDelegate> delegate;


-(instancetype)initWithDelegate:(id<CityHelperDelegate>) delegate;


@end
