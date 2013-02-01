//
//  MCPlayer.m
//  Minecraft Location
//
//  Created by Sean Wolter on 1/30/13.
//  Copyright (c) 2013 VOKAL. All rights reserved.
//

#import "MCPlayer.h"
#import "MCLocation.h"
@implementation MCPlayer

+ (NSArray *)playersFromArray:(NSArray *)anArray
{
    NSMutableArray *playersList = [[NSMutableArray alloc]init];
    [anArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        MCPlayer *player = [[MCPlayer alloc] initWithDictionary:(NSDictionary *)obj];
        [playersList addObject:player];
    }];
    return [playersList copy];
}


- (id)initWithDictionary:(NSDictionary *)params
{
    self = [super init];
    if (self) {
        _name = [params objectForKey:@"player"];
        _uuid = [params objectForKey:@"_id"];
        _lastLocation = [[MCLocation alloc]init];
        _lastLocation.xlocation = @132; // [params objectForKey:@"x"];
        _lastLocation.ylocation = @132; // [params objectForKey:@"y"];
        _lastLocation.zlocation = @132; // [params objectForKey:@"z"];
    }

    return self;
}


@end
