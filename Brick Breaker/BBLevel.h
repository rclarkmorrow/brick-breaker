//
//  BBLevel.h
//  Brick Breaker
//
//  Created by R. Clark Morrow on 10/27/14.
//  Copyright (c) 2014 self. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BBLevel : NSObject

@property (strong, nonatomic) NSArray *brickRowOne;
@property (strong, nonatomic) NSArray *brickRowTwo;
@property (strong, nonatomic) NSArray *brickRowThree;
@property (strong, nonatomic) NSArray *brickRowFour;
@property (strong, nonatomic) NSArray *brickRowFive;

@end
