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

//Note: change level array property to be single array and implement embedded array here
//but leave level class to implement parameters rather than constants for ball speed and
//perhaps pass gameworld physics modifications into main game controller.

-(NSArray *)gameLevels {
    
    
    BBLevel *one = [[BBLevel alloc]init];
    
    one.level = @[@[@0, @0, @0, @0, @0, @0],
                  @[@0, @0, @0, @0, @0, @0],
                  @[@0, @0, @0, @0, @0, @0],
                  @[@0, @0, @0, @0, @0, @0],
                  @[@0, @0, @0, @1, @0, @0]];
    
    BBLevel *two = [[BBLevel alloc]init];
    
    two.level = @[@[@1, @1, @2, @2, @1, @1],
                  @[@2, @2, @0, @0, @2, @2],
                  @[@2, @0, @0, @0, @0, @2],
                  @[@1, @0, @1, @1, @0, @1],
                  @[@1, @1, @2, @2, @1, @1]];
    
    BBLevel *three = [[BBLevel alloc]init];
    
    three.level = @[@[@1, @1, @2, @2, @1, @1],
                    @[@1, @1, @1, @1, @1, @1],
                    @[@0, @0, @3, @3, @0, @0],
                    @[@0, @0, @0, @0, @0, @0],
                    @[@3, @2, @1, @1, @2, @3]];
    
    BBLevel *four = [[BBLevel alloc]init];
    
    four.level = @[@[@4, @4, @1, @1, @4, @4],
                   @[@4, @4, @4, @4, @4, @4],
                   @[@4, @4, @4, @4, @4, @4],
                   @[@4, @4, @4, @4, @4, @4],
                   @[@4, @4, @4, @4, @4, @4]];


    

    
    NSArray *gameLevels = [[NSArray alloc] initWithObjects:one.level, two.level, three.level, four.level, nil];
    
    return gameLevels;
}
                           
                           

@end


    //Old

    
    //BBLevel *levelOne = [[BBLevel alloc]init];
    //levelOne.brickRowOne        = @[@4, @4, @4, @4, @4, @4];
    //levelOne.brickRowTwo        = @[@4, @4, @4, @4, @4, @4];
    //levelOne.brickRowThree      = @[@4, @4, @4, @4, @4, @4];
    //levelOne.brickRowFour       = @[@4, @4, @4, @4, @4, @4];
    //levelOne.brickRowFive       = @[@4, @4, @4, @4, @4, @4];
    //
    //BBLevel *levelTwo = [[BBLevel alloc]init];
    //levelTwo.brickRowOne        = @[@4, @4, @4, @4, @4, @4];
    //levelTwo.brickRowTwo        = @[@2, @2, @0, @0, @2, @2];
    //levelTwo.brickRowThree      = @[@4, @4, @4, @4, @4, @4];
    //levelTwo.brickRowFour       = @[@1, @0, @1, @1, @0, @1];
    //levelTwo.brickRowFive       = @[@4, @4, @4, @4, @4, @4];
    //
    //BBLevel *levelThree = [[BBLevel alloc]init];
    //levelThree.brickRowOne      = @[@4, @4, @4, @4, @4, @4];
    //levelThree.brickRowTwo      = @[@4, @4, @4, @4, @4, @4];
    //levelThree.brickRowThree    = @[@4, @4, @4, @4, @4, @4];
    //levelThree.brickRowFour     = @[@0, @0, @0, @0, @0, @0];
    //levelThree.brickRowFive     = @[@4, @4, @4, @4, @4, @4];
    //
    //BBLevel *levelFour = [[BBLevel alloc]init];
    //levelFour.brickRowOne       = @[@4, @4, @1, @1, @4, @4];
    //levelFour.brickRowTwo       = @[@4, @4, @4, @4, @4, @4];
    //levelFour.brickRowThree     = @[@4, @4, @4, @4, @4, @4];
    //levelFour.brickRowFour      = @[@4, @4, @4, @4, @4, @4];
    //levelFour.brickRowFive      = @[@4, @4, @4, @4, @4, @4];
    
    //    NSMutableArray *firstLevel = [[NSMutableArray alloc]init];
    //    [firstLevel addObject:levelOne.brickRowOne];
    //    [firstLevel addObject:levelOne.brickRowTwo];
    //    [firstLevel addObject:levelOne.brickRowThree];
    //    [firstLevel addObject:levelOne.brickRowFour];
    //    [firstLevel addObject:levelOne.brickRowFive];
    //
    //    NSMutableArray *secondLevel = [[NSMutableArray alloc]init];
    //    [secondLevel addObject:levelTwo.brickRowOne];
    //    [secondLevel addObject:levelTwo.brickRowTwo];
    //    [secondLevel addObject:levelTwo.brickRowThree];
    //    [secondLevel addObject:levelTwo.brickRowFour];
    //    [secondLevel addObject:levelTwo.brickRowFive];
    //
    //    NSMutableArray *thirdLevel = [[NSMutableArray alloc]init];
    //    [thirdLevel addObject:levelThree.brickRowOne];
    //    [thirdLevel addObject:levelThree.brickRowTwo];
    //    [thirdLevel addObject:levelThree.brickRowThree];
    //    [thirdLevel addObject:levelThree.brickRowFour];
    //    [thirdLevel addObject:levelThree.brickRowFive];
    //
    //    NSMutableArray *fourthLevel = [[NSMutableArray alloc]init];
    //    [fourthLevel addObject:levelFour.brickRowOne];
    //    [fourthLevel addObject:levelFour.brickRowTwo];
    //    [fourthLevel addObject:levelFour.brickRowThree];
    //    [fourthLevel addObject:levelFour.brickRowFour];
    //    [fourthLevel addObject:levelFour.brickRowFive];
