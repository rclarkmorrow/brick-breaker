//
//  BBBall.h
//  Brick Breaker
//
//  Created by R. Clark Morrow on 10/27/14.
//  Copyright (c) 2014 self. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface BBBall : SKSpriteNode

-(instancetype) initWithPosition:(CGPoint)position andVelocity:(CGVector)velocity andFrameWidth: (CGFloat)frameWidth;

@end
