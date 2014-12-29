//
//  BlockView.h
//  Block Blaster
//
//  Created by Arjun on 04/07/13.
//  Copyright (c) 2013 Arjun. All rights reserved.
//

#import <UIKit/UIKit.h>
#define RED_COLOR 0
#define GREEN_COLOR 1
#define BLUE_COLOR 2
@interface BlockView : UIView
{
int color;
}
@property int color;

-(id)initWithFrame:(CGRect)frame color:(int) inputColor;

@end
