//
//  BBPaddle.m
//  Brick Breaker
//
//  Created by R. Clark Morrow on 10/27/14.
//  Copyright (c) 2014 self. All rights reserved.
//

#import "BBPaddle.h"
#import "BBConstants.h"
#import "BBResizeToScale.h"

@implementation BBPaddle

-(instancetype)initWithFrameWidth:(CGFloat)frameWidth {
    
    if (self) {
        self = [super initWithImageNamed:@"Paddle"];
        BBResizeToScale *paddleSize = [[BBResizeToScale alloc]init];
        [paddleSize resizeRectangleSpriteNode:self andFrameWidth:frameWidth];
        self.size = paddleSize.newSize;
        self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.size];
        self.physicsBody.categoryBitMask = PADDLE_CATEGORY;
        self.physicsBody.dynamic = NO;
        self.position = CGPointMake(frameWidth * 0.5, 90);
        return self;
    }
    return self;
}

@end
