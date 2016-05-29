//
//  Server.h
//  Rehberim
//
//  Created by Most Wanted on 01/01/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>


@interface Server : NSObject

+(UIImage*)getImageFromParseBackend:(NSString*)categoryImageURL;

@end
