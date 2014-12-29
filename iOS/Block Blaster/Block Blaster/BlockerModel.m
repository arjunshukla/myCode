//
//  BlockerModel.m
//  Block Blaster
//
//  Created by Arjun on 04/07/13.
//  Copyright (c) 2013 Arjun. All rights reserved.
//

#import "BlockerModel.h"

@implementation BlockerModel

@synthesize arrBlocks,ballRect,paddleRect;

// override superclass implementation of init so that we can provide a properly initialized game model
-(id)init
{
    self = [super init];
    if(self)
    {
        // Init blocks
        // The array to hold the blocks
        arrBlocks = [[NSMutableArray alloc]initWithCapacity:15];
        
        BlockView *objBlockView;
        
        for(int row=0; row<=2;row++)
        {
            for(int col=0; col<5; col++)
            {
                objBlockView = [[BlockView alloc] initWithFrame:CGRectMake(col*BLOCK_WIDTH, row*BLOCK_HEIGHT, BLOCK_WIDTH, BLOCK_HEIGHT) color:row];
                
                // Add the block to the array
                [arrBlocks addObject:objBlockView];
            }
        }
        
        // Set the paddle rect by using the size of the paddle image
        UIImage * imgPaddle = [UIImage imageNamed:@"paddle.png"];
        CGSize paddleSize  = [imgPaddle size];
        paddleRect = CGRectMake(0.0, 420.0, paddleSize.width, paddleSize.height);
        
        // Set the ball rect by using the size of the ball image
        UIImage * imgBall = [UIImage imageNamed:@"ball.png"];
        CGSize ballSize = [imgBall size];
        ballRect = CGRectMake(180.0, 220.0, ballSize.width, ballSize.height);
        
        // Set the initial velocity for the ball
        ballVelocity = CGPointMake(200.0, -200.0);
        
        // Initialize the lastTime
        lastTime = 0.0;
    }
    return self;
}

-(void) updateModelWithTime:(CFTimeInterval)timestamp
{
    if(lastTime == 0.0)
    {
        // First time through initialize the lastTime
        lastTime = timestamp;
    }
    else
    {
        // Calculate time elapsed since last call
        timeDelta = timestamp - lastTime;
        
        // Update the last time;
        lastTime = timestamp;
        
        // Calculate the new position of the ball
        ballRect.origin.x += ballVelocity.x * timeDelta;
        ballRect.origin.y += ballVelocity.y * timeDelta;
        
        // Check for collision with screen edges
        [self checkCollisionWithScreenEdges];
        
        // Do collision detection with blocks
        [self checkCollisionWIthBlocks];
        
        // Do collision detection with paddle
        [self checkCollisionWithPaddle];
    }
}

-(void) checkCollisionWithScreenEdges
{
    // Change ball direction if it hit an edge of the screen
    
    // Left edge
    if(ballRect.origin.x<=0)
    {
        // Flip the x velocity component
        ballVelocity.x = abs(ballVelocity.x);
    }
    
    // Right edge
    if(ballRect.origin.x>=(VIEW_WIDTH - BALL_SIZE))
    {
        // Flip the x velocity component
        ballVelocity.x = -1*abs(ballVelocity.x);
    }
    
    // Top edge
    if(ballRect.origin.y<=0)
    {
        // Flip the y velocity component
        ballVelocity.y = abs(ballVelocity.y);
    }
    
    // Bottom edge
    if(ballRect.origin.y>=(VIEW_HEIGHT-BALL_SIZE))
    {
        // Ball went off the bottom of the screen
        ballRect.origin.x = 180.0;
        ballRect.origin.y = 220.0;
        
        // Flip the y velocity component
        ballVelocity.y = -1*abs(ballVelocity.y);
    }
}

-(void) checkCollisionWIthBlocks
{
    // Iterate over the blocks to see if a collision has happened
    for(BlockView * bv in arrBlocks)
    {
        if(CGRectIntersectsRect(bv.frame, ballRect))
        {
            // Flip the y velocity component
            ballVelocity.y = -ballVelocity.y;
            
            // Remove the block from the collection
            [arrBlocks removeObject:bv];
            
            // remove the blocks view from the superView
            [bv removeFromSuperview];
            break;
        }
    }
}

-(void) checkCollisionWithPaddle
{
    // Check to see if the paddle has blocked the ball
    if(CGRectIntersectsRect(ballRect, paddleRect))
    {
        // Flip the y velocity component
        ballVelocity.y = -1*abs(ballVelocity.y);
    }
}

@end
