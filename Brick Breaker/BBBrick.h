//
//  BBBrick.h
//  Brick Breaker
//
//  Created by R. Clark Morrow on 10/26/14.
//  Copyright (c) 2014 self. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>


typedef enum: NSUInteger {
    Green = 1,
    Blue = 2,
    Grey = 3,
} BrickType;

@interface BBBrick : SKSpriteNode

@property (nonatomic)BrickType type;
@property (nonatomic)BOOL isIndestructible;

-(instancetype)initWithType:(BrickType)type andFrameWidth:(CGFloat)frameWidth;
-(void)hit;

@end
