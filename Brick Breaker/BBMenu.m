//
//  BBMenu.m
//  Brick Breaker
//
//  Created by R. Clark Morrow on 10/27/14.
//  Copyright (c) 2014 self. All rights reserved.
//

#import "BBMenu.h"
#import "BBResizeToScale.h"

@implementation BBMenu {
    SKSpriteNode *_menuPanel;
    SKSpriteNode *_playButton;
    SKLabelNode *_panelText;
    SKLabelNode *_buttonText;
}

#pragma mark - Init Methods

-(instancetype)initWithFrameWidth:(CGFloat)frameWidth {
    
    self = [super init];
    if (self) {
        
        //Add Menu Panel
        
        _menuPanel = [SKSpriteNode spriteNodeWithImageNamed:@"MenuPanel"];
        BBResizeToScale *panelSize = [[BBResizeToScale alloc]init];
        [panelSize resizeRectangleSpriteNode:_menuPanel andFrameWidth:frameWidth];
        _menuPanel.size = panelSize.newSize;
        _menuPanel.position = CGPointZero;
        [self addChild:_menuPanel];
        
        //Add Play Button
        
        _playButton = [SKSpriteNode spriteNodeWithImageNamed:@"Button"];
        _playButton.name = @"Play Button";
        BBResizeToScale *buttonSize = [[BBResizeToScale alloc]init];
        [buttonSize resizeRectangleSpriteNode:_playButton andFrameWidth:frameWidth];
        _playButton.size = buttonSize.newSize;
        _playButton.position = CGPointMake(0, -((_menuPanel.size.height * 0.5) + (_playButton.size.height * 0.5) + 10));
        [self addChild:_playButton];
        
        //Add Panel Text
        
        _panelText = [SKLabelNode labelNodeWithFontNamed:@"Futura"];
        _panelText.text = [NSString stringWithFormat:@"LEVEL: %d", self.levelNumber + 1];
        _panelText.fontColor = [SKColor grayColor];
        _panelText.fontSize = 15;
        _panelText.verticalAlignmentMode = SKLabelVerticalAlignmentModeCenter;
        [_menuPanel addChild:_panelText];
        
        //Add Button Text
        
        _buttonText = [SKLabelNode labelNodeWithFontNamed:@"Futura"];
        _buttonText.name = @"Play Button";
        _buttonText.text = @"PLAY";
        _buttonText.position = CGPointMake(0, 2);
        _buttonText.fontColor = [SKColor grayColor];
        _buttonText.fontSize = 15;
        _buttonText.verticalAlignmentMode = SKLabelVerticalAlignmentModeCenter;
        [_playButton addChild:_buttonText];
    }
    return self;
}

#pragma mark - Public Methods

//Show & hide menu elements.

-(void)show{
    SKAction *slideLeft = [SKAction moveByX:-260.0 y:0.0 duration:0.5];
    slideLeft.timingMode = SKActionTimingEaseOut;
    SKAction *slideRight = [SKAction moveByX:260.0 y:0.0 duration:0.5];
    slideRight.timingMode = SKActionTimingEaseOut;
    _menuPanel.position = CGPointMake(260, _menuPanel.position.y);
    _playButton.position = CGPointMake(-260, _playButton.position.y);
    [_menuPanel runAction:slideLeft];
    [_playButton runAction:slideRight];
    self.hidden = NO;
}
-(void)hide{
    SKAction *slideLeft = [SKAction moveByX:-260.0 y:0.0 duration:0.5];
    slideLeft.timingMode = SKActionTimingEaseIn;
    SKAction *slideRight = [SKAction moveByX:260.0 y:0.0 duration:0.5];
    slideRight.timingMode = SKActionTimingEaseIn;
    _menuPanel.position = CGPointMake(0, _menuPanel.position.y);
    _playButton.position = CGPointMake(0, _playButton.position.y);
    [_menuPanel runAction:slideLeft];
    [_playButton runAction:slideRight completion:^{
        self.hidden = YES;
    }];
}

#pragma mark - Private Methods

//Updates level display on main menu.

-(void)setLevelNumber:(int)levelNumber {
    _levelNumber = levelNumber;
    _panelText.text = [NSString stringWithFormat:@"LEVEL: %d", levelNumber + 1];
}



@end
