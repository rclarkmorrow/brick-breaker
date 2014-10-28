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
    }
    return self;
}


-(void) newBall {
    
}



//
//
//-(SKSpriteNode *) createBall {
//    SKSpriteNode *ball = [SKSpriteNode spriteNodeWithImageNamed:@"BallBlue"];
//    ball.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:ball.size.width * 0.5];
//    ball.name = @"ball";
//    ball.position = CGPointMake(0, _paddle.size.height);
//    ball.physicsBody.linearDamping = 0.0;
//    ball.physicsBody.friction = 0.0;
//    ball.physicsBody.restitution = 1.0;
//    return ball;
//}
//
//
//
//-(SKSpriteNode *) createBallWithPosition:(CGPoint)position andVelocity:(CGVector)velocity {
//    SKSpriteNode *ball = [self createBall];
//    ball.position = position;
//    ball.physicsBody.velocity = velocity;
//    ball.physicsBody.categoryBitMask = BALL_CATEGORY;
//    ball.physicsBody.contactTestBitMask = PADDLE_CATEGORY | BRICK_CATEGORY | EDGE_CATEGORY;
//    [self addChild: ball];
//    return ball;
//}





@end
