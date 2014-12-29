//
//  OGSBarChart.h
//  OilAndGasSolution
//
//  Created by Arjun on 29/08/13.
//  
//

#import <UIKit/UIKit.h>
#import "CorePlot-CocoaTouch.h"
#import "OGSReportsViewController.h"
@interface OGSBarChart : UIViewController<CPTBarPlotDataSource, CPTBarPlotDelegate>
//@property (weak, nonatomic) IBOutlet CPTGraphHostingView *graphView;

@property OGSReportsViewController *obj;
@property (weak, nonatomic) CPTGraphHostingView *graphView;
-(void)initPlot;
@end
