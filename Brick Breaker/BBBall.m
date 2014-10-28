//
//  BBBall.m
//  Brick Breaker
//
//  Created by R. Clark Morrow on 10/27/14.
//  Copyright (c) 2014 self. All rights reserved.
//

#import "BBBall.h"
#import "BBConstants.h"
#import "BBResizeToScale.h"

@implementation BBBall

//Create instance of game ball.

-(instancetype) initWithPosition:(CGPoint)position andVelocity:(CGVector)velocity andFrameWidth:(CGFloat)frameWidth {
    
    if (self) {
       
        SKSpriteNode *ball = [super initWithImageNamed:@"BallBlue"];
        ball.name = @"ball";
        BBResizeToScale *ballSize = [[BBResizeToScale alloc]init];
        [ballSize resizeCircleSpriteNode:ball andFrameWidth:frameWidth];
        ball.position = position;
        ball.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:ball.size.width * 0.5];
        ball.physicsBody.velocity = velocity;
        ball.physicsBody.linearDamping = 0.0;
        ball.physicsBody.friction = 0.0;
        ball.physicsBody.restitution = 1.0;
        ball.physicsBody.categoryBitMask = BALL_CATEGORY;
        ball.physicsBody.contactTestBitMask = PADDLE_CATEGORY | BRICK_CATEGORY | EDGE_CATEGORY;
        ball.physicsBody.collisionBitMask = PADDLE_CATEGORY | BRICK_CATEGORY | EDGE_CATEGORY;
    }
    return self;
}


-(void) newBall {
    
    //Space Holder to implement a new ball from main game controlelr
}

@end
