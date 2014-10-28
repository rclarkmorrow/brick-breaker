//
//  GameScene.h
//  Brick Breaker
//

//  Copyright (c) 2014 self. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface GameScene : SKScene <SKPhysicsContactDelegate>

//Tracker Variables
@property (nonatomic) int score;
@property (nonatomic) int topScore;
@property (nonatomic) int lives;
@property (nonatomic) int currentLevel;


//Global Sprite Setup


@end
