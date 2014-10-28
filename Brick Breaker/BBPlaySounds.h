//
//  BBPlaySounds.h
//  Brick Breaker
//
//  Created by R. Clark Morrow on 10/27/14.
//  Copyright (c) 2014 self. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

typedef enum: NSUInteger {
    BallBounce = 1,
    BrickSmash = 2,
    LevelUp = 3,
    LoseLife = 4,
    PaddleBounce = 5,
} SoundType;


@interface BBPlaySounds : NSDictionary

@property (nonatomic)SoundType type;
@property (strong, nonatomic) SKAction *playSound;

-(instancetype)initWithType:(SoundType)type andWaitForCompletion:(bool)isWait;

@end
