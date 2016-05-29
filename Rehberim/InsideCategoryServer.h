//
//  InsideCategoryServer.h
//  Rehberim
//
//  Created by Most Wanted on 27/04/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Server.h"

@protocol InsideCategoryDelegate <NSObject>

@required

-(void)getAllInsideCategoryRequestSucceed:(NSArray*)allList;

@end


@interface InsideCategoryServer : Server < InsideCategoryDelegate >

@property (strong, nonatomic) id<InsideCategoryDelegate> delegate;


-(instancetype)initWithDelegate:(id<InsideCategoryDelegate>)delegate;

@end
