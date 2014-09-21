//
//  MLViewController.m
//  demo_instancetype类型
//
//  Created by Lwgfangz on 14-7-26.
//  Copyright (c) 2014年 Lwgfangz. All rights reserved.
//

#import "MLViewController.h"
#import "MLDemo.h"
#import "MLObject.h"
@interface MLViewController ()
{

}
@property (nonatomic,assign)MLObject *object;
@end

@implementation MLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)act_button:(id)sender
{
4x
    self.object = [MLObject new];
    NSLog(@"%@",_object);


//    NSBundle *mainBundel = [NSBundle mainBundle];
//    NSDictionary *info = [mainBundel infoDictionary];
//    NSString *className = [info objectForKey:@"MLDemo"];
//    NSLog(@"%@",className);
//    for(int i=0;i<100000;i++)
//    {
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^()
//                       {
//                           [MLDemo shareInstance];
//                       });
//
//    }
//
//    [[MLDemo alloc]init];

}
- (IBAction)action1:(id)sender
{
    NSLog(@"%@",_object);
    [_object release];
    _object=nil;
}

-(void)dealloc
{
    if(_object)
    [_object release];
    [super dealloc];
}


@end
