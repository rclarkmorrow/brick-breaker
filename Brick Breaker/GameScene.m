//
//  GameScene.m
//  Brick Breaker
//
//  Created by R. Clark Morrow on 10/26/14.
//  Copyright (c) 2014 self. All rights reserved.
//

#import "GameScene.h"
#import "BBConstants.h"
#import "BBPaddle.h"
#import "BBBrick.h"
#import "BBMenu.h"
#import "BBTopBar.h"
#import "BBHeart.h"
#import "BBPlaySounds.h"


@implementation GameScene{

    //Sprites & Nodes
    
    SKNode *_brickLayer;
    SKSpriteNode *_paddle;
    SKLabelNode *_levelLabel;
    BBMenu *_menu;
    BBTopBar *_topBar;
    BBHeart *_heartBar;
    
    //Sounds
    
    BBPlaySounds *_didBallBounce;
    BBPlaySounds *_didLevelUp;
    BBPlaySounds *_didLoseLife;
    BBPlaySounds *_didPaddleBounce;
    
    //Other Variables
    CGPoint _touchLocation;
    CGFloat _ballSpeed;
    CGFloat _frameWidth;
    CGFloat _frameHeight;
    BOOL _isBallReleased;
    BOOL _isPositioningBall;
    BOOL _isLevelFinished;
}

#pragma mark - View Load

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */

#pragma mark - Initial Values Set Up
    
    //Game Physics, Bounds & Layers
    
    _frameWidth = self.frame.size.width;
    _frameHeight = self.frame.size.height;
    
    self.backgroundColor = [SKColor whiteColor];
    self.physicsWorld.contactDelegate = self;
    self.physicsWorld.gravity = CGVectorMake(0.0, 0.0);
    self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:CGRectMake(0, -128, self.frame.size.width, self.frame.size.height + 100)];
    self.physicsBody.categoryBitMask = EDGE_CATEGORY;
    
    _brickLayer = [SKNode node];
    _brickLayer.position = CGPointMake(0, _frameHeight - 28);
    
    [self addChild:_brickLayer];
    
    //Load Menus & UI
    
    _menu= [[BBMenu alloc]initWithFrameWidth:_frameWidth];
    _menu.position = CGPointMake(_frameWidth * 0.5, _frameHeight * 0.5);
    [self addChild:_menu];
    [_menu show];
    
    _topBar = [[BBTopBar alloc] initWithFrameWidth:_frameWidth andFrameHeight:_frameHeight];
    _topBar.position = CGPointMake(0, 0);
    [self addChild:_topBar];
    
    _heartBar = [[BBHeart alloc]initWithFrameWidth:_frameWidth andFrameHeight:_frameHeight];
    _heartBar.position = CGPointMake(0, 0);
    [self addChild:_heartBar];
    
    _paddle = [[BBPaddle alloc]initWithFrameWidth:_frameWidth];
    [self addChild:_paddle];
    
    [self newBall];
    

    //Load Initial Sound Actions
    
    _didBallBounce = [[BBPlaySounds alloc]initWithType:BallBounce andWaitForCompletion:NO];
    _didLevelUp = [[BBPlaySounds alloc]initWithType:LevelUp andWaitForCompletion:NO];
    _didLoseLife = [[BBPlaySounds alloc]initWithType:LoseLife andWaitForCompletion:NO];
    _didPaddleBounce = [[BBPlaySounds alloc]initWithType:PaddleBounce andWaitForCompletion:NO];
    
    //Initialize Game
    
    _ballSpeed = 250;
    _isBallReleased = NO;
    _isLevelFinished = NO;
    _isPositioningBall = YES;
    self.currentLevel = 10;
    self.lives = STARTING_LIVES;
    [self loadLevel:self.currentLevel];

}

# pragma mark - Ball Methods

-(SKSpriteNode *) createBall {
    SKSpriteNode *ball = [SKSpriteNode spriteNodeWithImageNamed:@"BallBlue"];
    ball.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:ball.size.width * 0.5];
    ball.name = @"ball";
    ball.position = CGPointMake(0, _paddle.size.height);
    ball.physicsBody.linearDamping = 0.0;
    ball.physicsBody.friction = 0.0;
    ball.physicsBody.restitution = 1.0;
    return ball;
}

-(SKSpriteNode *) createBallWithPosition:(CGPoint)position andVelocity:(CGVector)velocity {
    SKSpriteNode *ball = [self createBall];
    ball.position = position;
    ball.physicsBody.velocity = velocity;
    ball.physicsBody.categoryBitMask = BALL_CATEGORY;
    ball.physicsBody.contactTestBitMask = PADDLE_CATEGORY | BRICK_CATEGORY | EDGE_CATEGORY;
    [self addChild: ball];
    return ball;
}

-(void)newBall {
    [self enumerateChildNodesWithName:@"ball" usingBlock:^(SKNode *node, BOOL *stop) {
        [node runAction:[SKAction removeFromParent]];
    }];
    [_paddle addChild:[self createBall]];
    _isBallReleased = NO;
}


#pragma mark - Contact Methods & Parameters


-(void)didBeginContact:(SKPhysicsContact *)contact {
    SKPhysicsBody *firstBody, *secondBody;

    
    if (contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask) {
        firstBody = contact.bodyA;
        secondBody = contact.bodyB;
    }
    else if (contact.bodyA.categoryBitMask > contact.bodyB.categoryBitMask){
        firstBody = contact.bodyB;
        secondBody = contact.bodyA;
    }
    
    if (firstBody.categoryBitMask == BALL_CATEGORY && secondBody.categoryBitMask == PADDLE_CATEGORY) {
        [self runAction:_didPaddleBounce.playSound];
        if (firstBody.node.position.y > secondBody.node.position.y) {
            CGPoint contactPaddle = [secondBody.node convertPoint:contact.contactPoint fromNode:self];
            CGFloat x = (contactPaddle.x + secondBody.node.frame.size.width * 0.5) / secondBody.node.frame.size.width;
            CGFloat multiplier = 1.0 - fmaxf(fminf(x, 1.0),0.0);
            CGFloat angle = (M_PI_2 * multiplier) + M_PI_4;
            CGVector direction = CGVectorMake(cosf(angle), sinf(angle));
            firstBody.velocity = CGVectorMake(direction.dx * _ballSpeed, direction.dy * _ballSpeed);
        }
    }
    
    if (firstBody.categoryBitMask == BALL_CATEGORY && secondBody.categoryBitMask == BRICK_CATEGORY) {
        if ([secondBody.node respondsToSelector:@selector(hit)]) [secondBody.node performSelector:@selector(hit)];
    }
    
    if (firstBody.categoryBitMask == BALL_CATEGORY && secondBody.categoryBitMask == EDGE_CATEGORY) {
        [self runAction:_didBallBounce.playSound];
    }
}

-(void)didEndContact:(SKPhysicsContact *)contact {

}

#pragma mark - Evaluation Methods

-(BOOL) didCompleteLevel {
    for (SKNode *node in _brickLayer.children) {
        if ([node isKindOfClass:[BBBrick class]]) {
            if (!((BBBrick*)node).isIndestructible) return NO;
        }
    }
    return YES;
}

-(void)setLives:(int)lives {
    _lives = lives;
    _heartBar.lives = lives;
}



#pragma mark - UI Touches Methods

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    for (UITouch *touch in touches) {
        if (_menu.hidden) {
            if (!_isBallReleased) {
                _isPositioningBall = YES;
            }
        }
        _touchLocation = [touch locationInNode:self];
    }
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if (_menu.hidden) {
        
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
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if (_menu.hidden) {
        
        for (UITouch *touch in touches){
            //Release Ball
            if (_isPositioningBall){
                _isPositioningBall = NO;
                _isBallReleased = YES;
                [self runAction:_didPaddleBounce.playSound];
                [_paddle removeAllChildren];
                [self createBallWithPosition:CGPointMake(_paddle.position.x, _paddle.position.y + _paddle.size.height)
                                 andVelocity:CGVectorMake(0, _ballSpeed)];
            }
        }
    }
    else if (!_menu.hidden) {
        for (UITouch *touch in touches) {
            if ([[_menu nodeAtPoint:[touch locationInNode:_menu]].name isEqualToString:@"Play Button"]) {
                [_menu hide];
            }
            
        }
    }
}

#pragma mark - Evaluation Methods

-(void)setCurrentLevel:(int)currentLevel {
    _currentLevel = currentLevel;
    _levelLabel.text = [NSString stringWithFormat:@"LEVEL: %d", currentLevel +1];
    _menu.levelNumber = currentLevel;
    _topBar.levelNumber = currentLevel;
}

-(void)didSimulatePhysics {
    [self enumerateChildNodesWithName:@"ball" usingBlock:^(SKNode *node, BOOL *stop) {
        if (node.frame.origin.y + node.frame.size.height < 0){
            [node runAction:[SKAction removeFromParent]];
        }
    }];
}

-(void)didEvaluateActions {
    
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    if ([self didCompleteLevel]) {
        self.currentLevel++;
        [self runAction:_didLevelUp.playSound];
        if (self.currentLevel > FINAL_LEVEL_NUMBER) {
            self.currentLevel = 1;
        }
        [self loadLevel:self.currentLevel];
        [self newBall];
        [_menu show];
    }
    else if (_isBallReleased && !_isPositioningBall && ![self childNodeWithName:@"ball"]) {
        self.lives--;
        [self runAction:_didLoseLife.playSound];
        if (self.lives < 0) {
            self.lives = 2;
            self.currentLevel = 0;
            [self loadLevel:self.currentLevel];
            [_menu show];
        }
        [self newBall];
    }
}

#pragma mark - Levels

-(void) loadLevel:(int)levelNumber {
    NSArray *level = nil;
    [_brickLayer removeAllChildren];
    switch (levelNumber) {
        
        case 0:
            level = @[@[@1,@1,@1,@1,@1,@1],
                      @[@1,@1,@1,@1,@1,@1],
                      @[@0,@0,@0,@0,@0,@0],
                      @[@0,@0,@0,@0,@0,@0],
                      @[@2,@2,@2,@2,@2,@0]];
            break;
        
        case 1:
            level = @[@[@1,@1,@2,@2,@1,@1],
                      @[@2,@2,@0,@0,@2,@2],
                      @[@2,@0,@0,@0,@0,@2],
                      @[@1,@0,@1,@1,@0,@1],
                      @[@1,@1,@3,@3,@1,@1]];
            break;
        
        case 2:
            level = @[@[@1,@1,@1,@1,@1,@1],
                      @[@1,@1,@1,@1,@1,@1],
                      @[@0,@0,@0,@0,@0,@0],
                      @[@0,@0,@0,@0,@0,@0],
                      @[@3,@2,@1,@1,@2,@3]];
            break;
        
        default:
            level = @[@[@0,@0,@0,@0,@0,@0],
                      @[@0,@0,@0,@0,@0,@0],
                      @[@0,@0,@0,@0,@0,@0],
                      @[@0,@0,@0,@0,@0,@0],
                      @[@1,@0,@0,@0,@0,@0]];
            break;
    }
    int row = 0;
    int col = 0;
    for (NSArray *rowBricks in level) {
        col = 0;
        for (NSNumber *brickType in rowBricks){
            if ([brickType intValue] > 0) {
                BBBrick *brick = [[BBBrick alloc] initWithType:(BrickType)[brickType intValue] andFrameWidth:_frameWidth];
                if (brick){
                    brick.position = CGPointMake((_frameWidth / 160) + (brick.size.width * 0.5) + ((brick.size.width + 4) * col), -((_frameWidth / 160) + (brick.size.height * 0.5) + ((brick.size.height + 3) * row)));
                    [_brickLayer addChild:brick];
                }
            }
            col++;
        }
        row++;
    }
    
    
}


@end
