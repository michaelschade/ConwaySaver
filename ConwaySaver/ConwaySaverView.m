//
//  ConwaySaverView.m
//  ConwaySaver
//
//  Created by Michael Schade on 7/4/14.
//  Copyright (c) 2014 Michael Schade. All rights reserved.
//

#import "ConwaySaverView.h"

@implementation ConwaySaverView

@synthesize board;

static CGFloat const scale = 40;

- (id)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:1/1.8];
    }
    return self;
}

- (void)startAnimation
{
    [super startAnimation];
    CGSize bounds = [self bounds].size;
    self.board = [[ConwayBoard alloc] init:(bounds.height/scale) columns:(bounds.width/scale)];
}

- (void)stopAnimation
{
    [super stopAnimation];
    self.board = nil;
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
}

- (void)animateOneFrame
{
    [[NSColor blackColor] set];
    NSRectFill([self bounds]);
    [[NSColor colorWithSRGBRed:SSRandomFloatBetween(0, 1) green:SSRandomFloatBetween(0, 1) blue:SSRandomFloatBetween(0, 1) alpha:SSRandomFloatBetween(0.75, 1)] set];
    for (NSMutableArray *row in board.board) {
        for (ConwayCell *cell in row) {
            if ([cell alive]) {
                NSRect cellRect = NSMakeRect(cell.column*scale, cell.row*scale, scale, scale);
                NSRectFill(cellRect);
            }
        }
    }
    [board tick];
    return;
}

- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

@end
