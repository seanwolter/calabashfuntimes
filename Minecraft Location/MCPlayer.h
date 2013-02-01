//
//  MCPlayer.h
//  Minecraft Location
//
//  Created by Sean Wolter on 1/30/13.
//  Copyright (c) 2013 VOKAL. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MCLocation;
@interface MCPlayer : NSObject
@property NSString *name;
@property NSString *uuid;
@property MCLocation *lastLocation;

+ (NSArray *)playersFromArray:(NSArray *)anArray;
- (id)initWithDictionary:(NSDictionary *)params;

@end
