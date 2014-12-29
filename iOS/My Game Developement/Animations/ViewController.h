//
//  ViewController.h
//  Animations
//
//  Created by Scott Kantner on 2/26/13.
//  Copyright (c) 2013 Scott Kantner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *myLabel;
@property (strong, nonatomic) IBOutlet UIView *myView;
@property (assign, nonatomic) NSUInteger nextMove;

- (IBAction)move:(id)sender;

@end
