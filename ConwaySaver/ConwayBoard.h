//
//  ConwayBoard.h
//  ConwaySaver
//
//  Created by Michael Schade on 7/4/14.
//  Copyright (c) 2014 Michael Schade. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConwayCell.h"

@interface ConwayBoard : NSObject

@property NSInteger rows;
@property NSInteger columns;
@property NSMutableArray *board;

- (id)init:(NSInteger)initRows columns:(NSInteger)initColumns;
- (void)tick;

@end
