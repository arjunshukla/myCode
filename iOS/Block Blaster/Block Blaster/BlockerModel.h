//
//  BlockerModel.h
//  Block Blaster
//
//  Created by Arjun on 04/07/13.
//  Copyright (c) 2013 Arjun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BlockView.h"

#define BLOCK_HEIGHT 20.0
#define BLOCK_WIDTH 64.0
#define BALL_SIZE 20.0
#define VIEW_WIDTH 320.0
#define VIEW_HEIGHT 460.0

@interface BlockerModel : NSObject
{
    NSMutableArray * arrBlocks;
    CGRect paddleRect;
    CGRect ballRect;
    CGPoint ballVelocity;
    CGFloat lastTime;
    CGFloat timeDelta;
}

@property (readonly) NSMutableArray* arrBlocks;
@property (readonly) CGRect ballRect;
@property CGRect paddleRect;

-(void) updateModelWithTime:(CFTimeInterval)timestamp;
-(void) checkCollisionWithScreenEdges;
-(void) checkCollisionWIthBlocks;
-(void) checkCollisionWithPaddle;

@end
