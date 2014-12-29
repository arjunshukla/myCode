//
//  ViewController.m
//  Block Blaster
//
//  Created by Arjun on 04/07/13.
//  Copyright (c) 2013 Arjun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize nextMove;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Initialize the game model
    objGameModel = [[BlockerModel alloc]init];
    // Iterate over the block in the model, drawing them
    for(BlockView * objBlockView in objGameModel.arrBlocks)
    {
        // Add the block to the view
        [self.view addSubview:objBlockView];
    }
    
    // Draw the paddle
    paddle = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"paddle.png"]];
    
    // Set the paddle position based on the model
    [paddle setFrame:objGameModel.paddleRect];
    [self.view addSubview:paddle];
    
    // Draw the ball
    ball = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ball.png"]];
    [ball setFrame:objGameModel.ballRect];
    [self.view addSubview:ball];
    
    // Set up the CADisplayLink for the animation
    gameTimer = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateDisplay:)];
    
    // Add the display link to the current run loop
    [gameTimer addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    self.nextMove = 0;
}

-(void)viewWillAppear:(BOOL)animated
{
    self.view.alpha = 0.0;
    [UIView animateWithDuration:3.0 animations:^
     {
         self.view.alpha = 1.0;
     }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateDisplay:(CADisplayLink*)sender
{
    // This method is called by the gameTimer each time the display should update
    
    // Update the model
    [objGameModel updateModelWithTime:sender.timestamp];
    
    // Update the display
    [ball setFrame:objGameModel.ballRect];
    [paddle setFrame:objGameModel.paddleRect];
    
    if([objGameModel.arrBlocks count]==0)
    {
        // No more blocks, end game
        [self endGameWithMessage:@"You Win !!! \n You Destroyed all the Blocks !"];
    }
}

-(void)endGameWithMessage:(NSString*)message
{
    // Call this method to end the game

    // Invalidate the timer
    [gameTimer invalidate];
    
    // Show an alert with the results
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"GAME OVER" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // Iterate over all touches
    t = [[event allTouches] anyObject];
    CGRect newPaddleRect = objGameModel.paddleRect;
    CGFloat delta;
    CGFloat x1,x2;
    for(t in touches)
    {
//        CGPoint location = [t locationInView:self.view];
        CGPoint location = [t locationInView:[UIApplication sharedApplication].keyWindow];
        CGPoint location2 = [t previousLocationInView:[UIApplication sharedApplication].keyWindow];
        
        x1 = location.x;
        x2 = location2.x;
        
//        NSLog(@"X1: %f",x1);
//        NSLog(@"X2: %f",x2);
        
        
        if (x1 == x2 )
        {
            delta = x1;
        }
        else
        {
            delta = x1 - x2;
        }

//        delta = [t locationInView:self.view].x - [t previousLocationInView:self.view].x;
//        delta = x1-x2;

        newPaddleRect.origin.x = objGameModel.paddleRect.origin.x;
//        CGPoint newPoint;
//        switch (self.nextMove)
//        {
//            case 0:
//            {
////                newPoint =  CGPointMake(0, 0);
//                newPoint.x = delta;
//                [UIView animateWithDuration:1.5 delay:0.0 options:UIViewAnimationCurveEaseInOut animations:^
//                 {
//                     CGRect frame = self.view.frame;
//                     frame.origin = newPoint;
////                     self.myView.frame = frame;
//                 }
//                                 completion:nil];
//                break;
//            }   
//            case 1:
//            {
//                newPoint = CGPointMake(300, 600);
//                [UIView animateWithDuration:1.0 animations:^
//                 {
//                     CGRect frame = self.view.frame;
//                     frame.origin = newPoint;
////                     self.myView.frame = frame;
////                     self.myView.transform = CGAffineTransformMakeScale(0.0, 0.0);
//                 } completion:nil];
//                
//                break;
//            }
//            default:
//                break;
//                self.nextMove++;
//        }

        newPaddleRect.origin.x = delta;
        objGameModel.paddleRect = newPaddleRect;
    }
}

@end
