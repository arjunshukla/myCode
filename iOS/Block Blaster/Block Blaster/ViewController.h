//
//  ViewController.h
//  Block Blaster
//
//  Created by Arjun on 04/07/13.
//  Copyright (c) 2013 Arjun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "BlockView.h"
#import "BlockerModel.h"


@interface ViewController : UIViewController
{
    BlockerModel * objGameModel;
    UIImageView * ball;
    UIImageView * paddle;
    CADisplayLink * gameTimer;
    UITouch *t;
}
@property (assign, nonatomic) NSUInteger nextMove;
-(void)updateDisplay:(CADisplayLink*)sender;
-(void)endGameWithMessage:(NSString*)message;

@end
