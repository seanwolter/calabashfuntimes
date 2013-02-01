//
//  MCLocation.m
//  Minecraft Location
//
//  Created by Sean Wolter on 1/30/13.
//  Copyright (c) 2013 VOKAL. All rights reserved.
//

#import "MCLocation.h"

@implementation MCLocation

//X: 362 Y: 67 Z: 1725
- (NSString*)locationString
{
    NSString *formatString = [NSString stringWithFormat:@"X: %@ Y: %@ Z: %@", self.xlocation, self.ylocation, self.zlocation];
    return formatString;
}
@end
