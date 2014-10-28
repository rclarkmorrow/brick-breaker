//
//  BBPlaySounds.m
//  Brick Breaker
//
//  Created by R. Clark Morrow on 10/27/14.
//  Copyright (c) 2014 self. All rights reserved.
//

#import "BBPlaySounds.h"

@implementation BBPlaySounds

//Stores SKActions for sounds for instancing as variables in classes.

-(instancetype)initWithType:(SoundType)type andWaitForCompletion:(bool)isWait {
    
    self = [super init];
    
    switch (type) {
        case BallBounce:
            self.playSound = [SKAction playSoundFileNamed:@"BallBounce.caf" waitForCompletion:isWait];
            break;
        case BrickSmash:
            self.playSound = [SKAction playSoundFileNamed:@"BrickSmash.caf" waitForCompletion:isWait];
            break;
        case LevelUp:
            self.playSound = [SKAction playSoundFileNamed:@"LevelUp.caf" waitForCompletion:isWait];
            break;
        case LoseLife:
            self.playSound = [SKAction playSoundFileNamed:@"LoseLife.caf" waitForCompletion:isWait];
            break;
        case PaddleBounce:
            self.playSound = [SKAction playSoundFileNamed:@"PaddleBounce.caf" waitForCompletion:isWait];
            break;
    }
    return self;
}

@end
