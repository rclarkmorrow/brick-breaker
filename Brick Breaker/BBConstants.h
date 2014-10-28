//
//  BBConstants.h
//  Brick Breaker
//
//  Created by R. Clark Morrow on 10/27/14.
//  Copyright (c) 2014 self. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

//Category BitMasks

static const uint32_t BALL_CATEGORY     = 0x1 << 0;
static const uint32_t PADDLE_CATEGORY   = 0x1 << 1;
static const uint32_t BRICK_CATEGORY    = 0x1 << 2;
static const uint32_t EDGE_CATEGORY     = 0x1 << 3;

//Constants

static const int STARTING_LIVES = 3;
static const int BALL_SPEED = 250;

@interface BBConstants : NSObject

@end
