//
//  OGSReportsViewController.h
//  OilAndGasSolution
//
//  Created by Arjun on 26/08/13.


#import <UIKit/UIKit.h>
#import "CorePlot-CocoaTouch.h"

@interface OGSReportsViewController : UIViewController <CPTPieChartDataSource, CPTPieChartDelegate,CPTBarPlotDataSource, CPTBarPlotDelegate> {
    BOOL isBar, isPie;
    int counter;
}



// Charting code

- (IBAction)btnPieChart:(id)sender;
- (IBAction)btnBarChart:(id)sender;
- (IBAction)btnPlotGraph:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *viewPieChart;
//@property (strong, nonatomic) IBOutlet UIView *viewBarChart;
//@property (strong, nonatomic) IBOutlet UIView *viewGraphChart;
@property (strong, nonatomic) NSDictionary *responseDictionary;
@property (strong, nonatomic) NSArray * arrSector;
// Graph plots
@property (nonatomic, strong) CPTGraphHostingView *hostView;
@property (weak, nonatomic) IBOutlet CPTGraphHostingView *graphView;
@property (nonatomic, strong) CPTTheme *selectedTheme;


// Graph plot methods
-(void)initPlot;
-(void)configureHost;
-(void)configureGraph;
-(void)configureChart;
-(void)configureLegend;
// End of charting code
@end