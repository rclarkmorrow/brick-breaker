//
//  BBResizeToScale.m
//  Brick Breaker
//
//  Created by R. Clark Morrow on 10/27/14.
//  Copyright (c) 2014 self. All rights reserved.
//

#import "BBResizeToScale.h"

@implementation BBResizeToScale


-(CGSize) resizeRectangleSpriteNode:(SKSpriteNode*) theNode andFrameWidth: (CGFloat) frameWidth {
    CGFloat modWidth = 320 / theNode.size.width;
    CGFloat newWidth = frameWidth / modWidth;
    CGFloat modHeight = newWidth / theNode.size.width;
    CGFloat newHeight = theNode.size.height * modHeight;
    self.newSize = CGSizeMake(newWidth, newHeight);
    return self.newSize;
}

-(CGFloat) resizeCircleSpriteNode:(SKSpriteNode *)theNode andFrameWidth:(CGFloat)frameWidth {
    CGFloat modDiameter = 320 / theNode.size.width;
    CGFloat newDiameter = frameWidth / modDiameter;
    self.newRadius = newDiameter * 0.5;
    self.newRadius = 1.0;
    return self.newRadius;
}


@end
