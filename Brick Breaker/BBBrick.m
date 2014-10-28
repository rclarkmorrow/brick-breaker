//
//  BBBrick.m
//  Brick Breaker
//
//  Created by R. Clark Morrow on 10/26/14.
//  Copyright (c) 2014 self. All rights reserved.
//

#import "BBBrick.h"
#import "BBConstants.h"
#import "BBResizeToScale.h"
#import "BBPlaySounds.h"

@implementation BBBrick {
    BBPlaySounds *_didBrickSmash;
    BBPlaySounds *_didBallBounce;
}

-(instancetype)initWithType:(BrickType)type andFrameWidth:(CGFloat)frameWidth {
    
    switch (type) {
        case Green:
            self = [super initWithImageNamed:@"BrickGreen"];
            break;
        case Blue:
            self = [super initWithImageNamed:@"BrickBlue"];
            break;
        case Grey:
            self = [super initWithImageNamed:@"BrickGrey"];
            self.isIndestructible = YES;
            break;
        case Yellow:
            self = [super initWithImageNamed:@"BrickYellow"];
            self.doesSpawnExtraBall = YES;
            break;
        default:
            self = nil;
            break;
    }

if (self) {
    self.type = type;
    BBResizeToScale *size = [[BBResizeToScale alloc]init];
    [size resizeRectangleSpriteNode:self andFrameWidth:frameWidth];
    self.size = size.newSize;
    self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.size];
    self.physicsBody.categoryBitMask = BRICK_CATEGORY;
    self.physicsBody.dynamic = NO;
    
    _didBrickSmash = [[BBPlaySounds alloc]initWithType:BrickSmash andWaitForCompletion:NO];
    _didBallBounce = [[BBPlaySounds alloc]initWithType:BallBounce andWaitForCompletion:NO];
    }
    return self;
}

//Evaluator for when a ball collides with a brick.

-(void)hit {
    
    switch (self.type) {
        case Green:
            [self runAction:_didBrickSmash.playSound];
            [self didBrickBreak];
            [self runAction:[SKAction removeFromParent]];
            break;
        case Blue:
            [self runAction:_didBallBounce.playSound];
            self.texture = [SKTexture textureWithImageNamed: @"BrickGreen"];
            self.type = Green;
            break;
        case Grey:
            [self runAction:_didBallBounce.playSound];
            
        case Yellow:
            [self runAction:_didBrickSmash.playSound];
            [self didBrickBreak];
            [self runAction:[SKAction removeFromParent]];
            break;
        default:
            NSLog(@"Brick Type in (hit) function defaulting.");
            break;
    }
}

//Function governing the explosion of bricks: consider making the color of the Emitter dynamic
//according to color of brick.

-(void)didBrickBreak {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"BrickBreak" ofType:@"sks"];
    SKEmitterNode *brickBreak = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    brickBreak.position = self.position;
    [self.parent addChild:brickBreak];
    SKAction *removeBrickBreak = [SKAction sequence:@[[SKAction waitForDuration:brickBreak.particleLifetime + brickBreak.particleLifetimeRange], [SKAction removeFromParent]]];
    [brickBreak runAction:removeBrickBreak];
}

@end
