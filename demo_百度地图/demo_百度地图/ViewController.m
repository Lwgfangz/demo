//
//  ViewController.m
//  demo_百度地图
//
//  Created by Lwgfangz on 14-6-27.
//  Copyright (c) 2014年 aiDriving.com. All rights reserved.
//

#import "ViewController.h"
#import "BMapKit.h"

#define MARGIN 4 //边缘的空白
#define MAPVIEW_HEIGHT 204 //边缘的空白
@interface ViewController ()<BMKMapViewDelegate>
{
}
@property (nonatomic,strong)BMKMapView *mapView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    

	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated
{
    //Lwgfangz add
    CGRect rect = CGRectMake(MARGIN, MARGIN, self.view.frame.size.width - MARGIN*2, MAPVIEW_HEIGHT);
    self.mapView = [[BMKMapView alloc] initWithFrame:rect];
    _mapView.layer.cornerRadius = 20;
    _mapView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:_mapView];
    //Lwgfangz add~
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
