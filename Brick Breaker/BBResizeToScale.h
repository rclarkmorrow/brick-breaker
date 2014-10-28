//
//  BBResizeToScale.h
//  Brick Breaker
//
//  Created by R. Clark Morrow on 10/27/14.
//  Copyright (c) 2014 self. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface BBResizeToScale : NSObject

@property (nonatomic) CGSize newSize;
@property (nonatomic) CGFloat newRadius;

-(CGSize) resizeRectangleSpriteNode:(SKSpriteNode*) theNode andFrameWidth: (CGFloat) frameWidth;
-(CGFloat) resizeCircleSpriteNode:(SKSpriteNode *) theNode andFrameWidth: (CGFloat) frameWidth;

@end
