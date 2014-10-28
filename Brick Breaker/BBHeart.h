//
//  BBHeart.h
//  Brick Breaker
//
//  Created by R. Clark Morrow on 10/27/14.
//  Copyright (c) 2014 self. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface BBHeart : SKNode

@property (strong, nonatomic) NSMutableArray *hearts;
@property (nonatomic) int lives;

-(instancetype) initWithFrameWidth: (CGFloat)frameWidth andFrameHeight: (CGFloat) frameHeight;

@end
