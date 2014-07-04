//
//  ConwayCell.m
//  ConwaySaver
//
//  Created by Michael Schade on 7/4/14.
//  Copyright (c) 2014 Michael Schade. All rights reserved.
//

#import "ConwayCell.h"

@implementation ConwayCell

@synthesize alive, row, column;

-(id)initWithCoordinates:(NSInteger)initRow withColumn:(NSInteger)initColumn {
    self.row = initRow;
    self.column = initColumn;
    self.alive = drand48() > 0.92;
    return self;
}

- (ConwayCell *)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        self.row = [coder decodeIntegerForKey:@"row"];
        self.column = [coder decodeIntegerForKey:@"column"];
        self.alive = [coder decodeBoolForKey:@"alive"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeInteger:self.row forKey:@"row"];
    [coder encodeInteger:self.column forKey:@"column"];
    [coder encodeBool:self.alive forKey:@"alive"];
}

@end
