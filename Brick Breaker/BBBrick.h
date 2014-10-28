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
    Yellow = 4
} BrickType;

@interface BBBrick : SKSpriteNode

@property (nonatomic)BrickType type;
@property (nonatomic)BOOL isIndestructible;
@property (nonatomic)BOOL doesSpawnExtraBall;

-(instancetype)initWithType:(BrickType)type andFrameWidth:(CGFloat)frameWidth;
-(void)hit;

@end
