//
//  Server.m
//  Rehberim
//
//  Created by Most Wanted on 01/01/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import "Server.h"

@implementation Server

+(UIImage*)getImageFromParseBackend:(NSString*)categoryImageURL{
    
    NSURL *imageURL = [[NSURL alloc] initWithString:categoryImageURL];
    
    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
    
    UIImage *cityImage = [UIImage imageWithData:imageData];
    
    return cityImage;
    
}


@end
