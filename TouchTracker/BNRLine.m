//
//  BNRLine.m
//  TouchTracker
//
//  Created by Steven Liu on 2016-06-16.
//  Copyright © 2016 Steven Liu. All rights reserved.
//

#import "BNRLine.h"

@implementation BNRLine

- (void) encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:[NSValue valueWithCGPoint:self.begin] forKey:@"begin"];
    [encoder encodeObject:[NSValue valueWithCGPoint:self.end] forKey:@"end"];
    [encoder encodeObject:self.color forKey:@"color"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init]) {
        self.begin = [[decoder decodeObjectForKey:@"begin"] CGPointValue];
        self.end = [[decoder decodeObjectForKey:@"end"] CGPointValue];
        self.color = [decoder decodeObjectForKey:@"color"];
    }
    return self;
}

@end
