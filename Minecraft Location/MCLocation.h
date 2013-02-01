//
//  MCLocation.h
//  Minecraft Location
//
//  Created by Sean Wolter on 1/30/13.
//  Copyright (c) 2013 VOKAL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCLocation : NSObject
@property NSNumber *xlocation;
@property NSNumber *ylocation;
@property NSNumber *zlocation;

- (NSString *)locationString;

@end
