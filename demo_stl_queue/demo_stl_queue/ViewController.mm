//
//  ViewController.m
//  demo_stl_queue
//
//  Created by Lwgfangz on 14-7-25.
//  Copyright (c) 2014年 aiDriving.com. All rights reserved.
//

#import "ViewController.h"
#import <queue>
using namespace std;
typedef struct _st
{
    int a;
    int b;
}st;
@interface ViewController ()
{
    queue <st> qu;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    for (int i=0; i<500; i++)
    {
        st s;
        s.a = i;
        s.b = i;
        qu.push(s);
    }
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated
{
    for(int i=0;i<500;i++)
    {
        st *pSt = NULL;
        pSt = &qu.front();
        qu.pop();
        NSLog(@"====%d %d",pSt->a,pSt->b);
    }

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
