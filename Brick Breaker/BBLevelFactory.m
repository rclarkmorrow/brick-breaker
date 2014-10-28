//
//  BBLevelFactory.m
//  Brick Breaker
//
//  Created by R. Clark Morrow on 10/27/14.
//  Copyright (c) 2014 self. All rights reserved.
//

#import "BBLevelFactory.h"
#import "BBLevel.h"

@implementation BBLevelFactory

-(NSArray *)gameLevels {
    
    BBLevel *levelOne = [[BBLevel alloc]init];
    levelOne.brickRowOne        = @[@1, @1, @1, @1, @1, @1];
    levelOne.brickRowTwo        = @[@1, @1, @1, @1, @1, @1];
    levelOne.brickRowThree      = @[@0, @0, @0, @0, @0, @0];
    levelOne.brickRowFour       = @[@0, @0, @0, @0, @0, @0];
    levelOne.brickRowFive       = @[@0, @0, @1, @1, @0, @0];
    
    BBLevel *levelTwo = [[BBLevel alloc]init];
    levelTwo.brickRowOne        = @[@1, @1, @2, @2, @1, @1];
    levelTwo.brickRowTwo        = @[@2, @2, @0, @0, @2, @2];
    levelTwo.brickRowThree      = @[@2, @0, @0, @0, @0, @2];
    levelTwo.brickRowFour       = @[@1, @0, @1, @1, @0, @1];
    levelTwo.brickRowFive       = @[@1, @1, @2, @2, @1, @1];
    
    BBLevel *levelThree = [[BBLevel alloc]init];
    levelThree.brickRowOne      = @[@1, @1, @2, @2, @1, @1];
    levelThree.brickRowTwo      = @[@1, @1, @1, @1, @1, @1];
    levelThree.brickRowThree    = @[@0, @0, @3, @3, @0, @0];
    levelThree.brickRowFour     = @[@0, @0, @0, @0, @0, @0];
    levelThree.brickRowFive     = @[@3, @2, @1, @1, @2, @3];
    
    BBLevel *levelFour = [[BBLevel alloc]init];
    levelFour.brickRowOne       = @[@4, @4, @1, @1, @4, @4];
    levelFour.brickRowTwo       = @[@4, @4, @4, @4, @4, @4];
    levelFour.brickRowThree     = @[@4, @4, @4, @4, @4, @4];
    levelFour.brickRowFour      = @[@4, @4, @4, @4, @4, @4];
    levelFour.brickRowFive      = @[@4, @4, @4, @4, @4, @4];
    
    NSMutableArray *firstLevel = [[NSMutableArray alloc]init];
    [firstLevel addObject:levelOne.brickRowOne];
    [firstLevel addObject:levelOne.brickRowTwo];
    [firstLevel addObject:levelOne.brickRowThree];
    [firstLevel addObject:levelOne.brickRowFour];
    [firstLevel addObject:levelOne.brickRowFive];
    
    NSMutableArray *secondLevel = [[NSMutableArray alloc]init];
    [secondLevel addObject:levelTwo.brickRowOne];
    [secondLevel addObject:levelTwo.brickRowTwo];
    [secondLevel addObject:levelTwo.brickRowThree];
    [secondLevel addObject:levelTwo.brickRowFour];
    [secondLevel addObject:levelTwo.brickRowFive];
    
    NSMutableArray *thirdLevel = [[NSMutableArray alloc]init];
    [thirdLevel addObject:levelThree.brickRowOne];
    [thirdLevel addObject:levelThree.brickRowTwo];
    [thirdLevel addObject:levelThree.brickRowThree];
    [thirdLevel addObject:levelThree.brickRowFour];
    [thirdLevel addObject:levelThree.brickRowFive];
    
    NSMutableArray *fourthLevel = [[NSMutableArray alloc]init];
    [fourthLevel addObject:levelFour.brickRowOne];
    [fourthLevel addObject:levelFour.brickRowTwo];
    [fourthLevel addObject:levelFour.brickRowThree];
    [fourthLevel addObject:levelFour.brickRowFour];
    [fourthLevel addObject:levelFour.brickRowFive];
    
    NSArray *gameLevels = [[NSArray alloc] initWithObjects:firstLevel, secondLevel, thirdLevel, fourthLevel, nil];
    
    return gameLevels;
}

@end
