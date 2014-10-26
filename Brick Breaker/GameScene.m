//
//  GameScene.m
//  Brick Breaker
//
//  Created by R. Clark Morrow on 10/26/14.
//  Copyright (c) 2014 self. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene{

    SKSpriteNode *_paddle;

    CGPoint _touchLocation;
}

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    
    self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
    
    //Setup Paddle
    _paddle = [SKSpriteNode spriteNodeWithImageNamed:@"Paddle"];
    _paddle.position = CGPointMake(self.size.width * 0.5, 90);
    [self addChild:_paddle];
    
    
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    for (UITouch *touch in touches) {
        _touchLocation = [touch locationInNode:self];
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        
        //Calculating how far touch moved on X-Axis
        CGFloat xMovement = [touch locationInNode:self].x - _touchLocation.x;
        CGFloat paddleMinX = _paddle.size.width * -0.25;
        CGFloat paddleMaxX = self.size.width + (_paddle.size.width * 0.25);
        
        //Move Paddle
        _paddle.position = CGPointMake(_paddle.position.x +xMovement, _paddle.position.y);

        if (_paddle.position.x < paddleMinX) {
         _paddle.position = CGPointMake(paddleMinX, _paddle.position.y);   
        }
        if (_paddle.position.x > paddleMaxX) _paddle.position = CGPointMake(paddleMaxX, _paddle.position.y);
        
        _touchLocation = [touch locationInNode:self];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
