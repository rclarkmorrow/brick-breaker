//
//  BBMenu.h
//  Brick Breaker
//
//  Created by R. Clark Morrow on 10/27/14.
//  Copyright (c) 2014 self. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface BBMenu : SKNode

@property (nonatomic) int levelNumber;

-(instancetype) initWithFrameWidth: (CGFloat)frameWidth;

-(void)hide;
-(void)show;

@end
