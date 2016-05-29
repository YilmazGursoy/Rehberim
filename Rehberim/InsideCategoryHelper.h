//
//  InsideCategoryHelper.h
//  Rehberim
//
//  Created by Most Wanted on 27/04/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InsideCategoryServer.h"

@protocol InsideCategoryHelperDelegate <NSObject>

@required

-(void)getAllInsideCategoriesObject:(NSArray*)insideCategories;


@end


@interface InsideCategoryHelper : NSObject <InsideCategoryDelegate, InsideCategoryHelperDelegate>

@property (weak, nonatomic) id<InsideCategoryHelperDelegate> delegate;


-(instancetype)initWithDelegate:(id<InsideCategoryHelperDelegate>)delegate;

@end
