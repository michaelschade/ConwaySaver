//
//  ConwayCell.h
//  ConwaySaver
//
//  Created by Michael Schade on 7/4/14.
//  Copyright (c) 2014 Michael Schade. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConwayCell : NSObject <NSCoding>

@property BOOL alive;
@property NSInteger row;
@property NSInteger column;

-(id)initWithCoordinates:(NSInteger)initRow withColumn:(NSInteger)initColumn;

@end
