//
//  BBHeart.m
//  Brick Breaker
//
//  Created by R. Clark Morrow on 10/27/14.
//  Copyright (c) 2014 self. All rights reserved.
//

#import "BBHeart.h"

@implementation BBHeart {
    CGFloat _frameWidth;
    CGFloat _frameHeight;
}

//Initialize Heart w/ Parameters

-(instancetype) initWithFrameWidth: (CGFloat)frameWidth andFrameHeight: (CGFloat) frameHeight {
  
    if (self) {
        self = [super init];
        self.hearts = [[NSMutableArray alloc]init];
        _frameWidth = frameWidth;
        _frameHeight = frameHeight;
    }
    return self;
}

//Create heart array with initial lives value & update lives when lost or gained.

-(void)setLives:(int)lives{
    _lives = lives;
    if (self.hearts.count == 0) {
        [self createInitialHeartsArrayWith:_frameWidth andFrameHeight:_frameHeight];
    }
    for (NSUInteger i = 0; i < self.hearts.count; i++){
            SKSpriteNode *displayHeart = (SKSpriteNode *) [self.hearts objectAtIndex:i];
            if (lives > i) displayHeart.texture = [SKTexture textureWithImageNamed:@"HeartFull"];
            else           displayHeart.texture = [SKTexture textureWithImageNamed:@"HeartEmpty"];
        }
}

//Creates an array of hearts & displays them on the top bar.

-(void) createInitialHeartsArrayWith: (CGFloat)frameWidth andFrameHeight: (CGFloat)frameHeight {
    for (NSUInteger i = 0; i < self.lives; i++) {
        SKSpriteNode *displayHeart = [SKSpriteNode spriteNodeWithImageNamed:@"HeartEmpty"];
        displayHeart.position = CGPointMake(frameWidth - ((frameWidth / 20) + (frameWidth / 11.03) * i), frameHeight - 14);
        [self.hearts addObject:displayHeart];
        [self addChild:displayHeart];
    }
}

@end
