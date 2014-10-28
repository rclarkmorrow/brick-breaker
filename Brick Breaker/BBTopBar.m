//
//  BBTopBar.m
//  Brick Breaker
//
//  Created by R. Clark Morrow on 10/27/14.
//  Copyright (c) 2014 self. All rights reserved.
//

#import "BBTopBar.h"

@implementation BBTopBar {
    SKSpriteNode *_topBar;
    SKLabelNode *_levelLabel;
}

-(instancetype) initWithFrameWidth:(CGFloat)frameWidth andFrameHeight:(CGFloat)frameHeight {
    
    self = [super init];
    if (self) {
        
        //Create Label Bar
        
        _topBar = [SKSpriteNode spriteNodeWithColor:[SKColor colorWithRed:0.831 green:0.831 blue:0.831 alpha:1.0]
                                               size:CGSizeMake(frameWidth, 28)];
        
        _topBar.position = CGPointMake(frameWidth * 0.5, frameHeight - 14);
        [self addChild:_topBar];
        
        //Create Label
        
        _levelLabel = [SKLabelNode labelNodeWithFontNamed:@"Futura"];
        _levelLabel.text = [NSString stringWithFormat: @"LEVEL: %d", _levelNumber + 1];
        _levelLabel.fontColor = [SKColor grayColor];
        _levelLabel.fontSize = 15;
        _levelLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
        _levelLabel.verticalAlignmentMode = SKLabelVerticalAlignmentModeCenter;
        _levelLabel.position = CGPointMake(_topBar.size.width * -0.475, 0);
        [_topBar addChild:_levelLabel];
    }
    return self;
    
//    - (_topBar.size.width * 1.15)
}

#pragma mark - Private Methods

-(void)setLevelNumber:(int)levelNumber {
    _levelNumber = levelNumber;
    _levelLabel.text = [NSString stringWithFormat:@"LEVEL: %d", levelNumber + 1];
}

@end
