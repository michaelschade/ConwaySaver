//
//  ConwayBoard.m
//  ConwaySaver
//
//  Created by Michael Schade on 7/4/14.
//  Copyright (c) 2014 Michael Schade. All rights reserved.
//

#import "ConwayBoard.h"

@implementation ConwayBoard

@synthesize rows, columns, board;

- (id)init:(NSInteger)initRows columns:(NSInteger)initColumns {
    self.rows = initRows;
    self.columns = initColumns;
    self.board = [[NSMutableArray alloc] init];
    
    // populate board
    for (NSInteger rowIndex = 0; rowIndex < rows; rowIndex++) {
        NSMutableArray *row = [[NSMutableArray alloc] init];
        for (NSInteger columnIndex = 0; columnIndex < columns; columnIndex++) {
            ConwayCell *cell = [[ConwayCell alloc] initWithCoordinates:rowIndex withColumn:columnIndex];
            [row addObject:cell];
        }
        [board addObject:row];
    }
    
    return self;
}

- (ConwayCell *)findCell:(NSInteger)row column:(NSInteger)column {
    if (row < 0 || row >= rows || column < 0 || column >= columns) {
        return nil;
    }
    return board[row][column];
}

- (BOOL)liveCell:(NSInteger)row column:(NSInteger)column {
    ConwayCell *cell = [self findCell:row column:column];
    return cell && [cell alive];
}

- (NSInteger)numLiveNeighbors:(ConwayCell *)cell {
    NSInteger liveNeighbors = 0;
    if ([self liveCell:([cell row] - 1) column:([cell column] - 1)]) { liveNeighbors++; }
    if ([self liveCell:([cell row] - 1) column:([cell column] + 0)]) { liveNeighbors++; }
    if ([self liveCell:([cell row] - 1) column:([cell column] + 1)]) { liveNeighbors++; }
    if ([self liveCell:([cell row] + 0) column:([cell column] - 1)]) { liveNeighbors++; }
    if ([self liveCell:([cell row] + 0) column:([cell column] + 1)]) { liveNeighbors++; }
    if ([self liveCell:([cell row] + 1) column:([cell column] - 1)]) { liveNeighbors++; }
    if ([self liveCell:([cell row] + 1) column:([cell column] + 0)]) { liveNeighbors++; }
    if ([self liveCell:([cell row] + 1) column:([cell column] + 1)]) { liveNeighbors++; }
    return liveNeighbors;
}

- (NSInteger)height {
    return rows;
}

- (NSInteger)width {
    return columns;
}

- (void)tick {
    NSArray *oldBoard = [NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver archivedDataWithRootObject:board]];
    for (NSMutableArray *row in oldBoard) {
        for (ConwayCell *oldCell in row) {
            ConwayCell *newCell = board[oldCell.row][oldCell.column];
            NSInteger neighbors = [self numLiveNeighbors:oldCell];
            if (neighbors < 2 || neighbors >= 4) {
                [newCell setAlive:false];
            } else if (neighbors == 3 && oldCell.alive == false) {
                [newCell setAlive:true];
            }
        }
    }
}

@end
