//
//  ViewController.m
//  demo_串行队列
//
//  Created by Lwgfangz on 14-7-4.
//  Copyright (c) 2014年 aiDriving.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (atomic,assign)BOOL isFinish;
@property (atomic,strong)dispatch_queue_t queue;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


-(void)viewDidAppear:(BOOL)animated
{
    _queue = dispatch_queue_create("write file queue", 0);
    for(int i = 0 ;i<10;i++)
    {
        NSLog(@"下载 i = %d",i);
        [self downloadFiles:^()
        {
            NSLog(@"下载完成 i = %d",i);
        }];

    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)downloadFiles:(void (^)()) success
{
    
    _isFinish = NO;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^()
                   {
                       [self downloadFileRequest];
                   });
    while (!_isFinish)
    {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    }
    return;
    

}

-(void)downloadFileRequest
{

    NSLog(@"发送请求");
    sleep(2);
    NSLog(@"发送请求完成");
    
    for(int i = 0;i<4;i++)//模拟数据返回,很快
    {
        //这里不能使用globle queue,globle queue是一种并行队列,使得返回的包的顺序有可能乱了.
        //所以用main_queue,真实场景的回调函数也应该在主线程中
        dispatch_async(dispatch_get_main_queue(), ^()
        {
            [self downloadCallback:i];
        });
    }

}

-(void)downloadCallback:(NSInteger)i
{
    dispatch_sync(_queue,^()
    {
        [self writeFile:i];
    });

}

-(void)writeFile:(NSInteger)i
{
    NSLog(@"写数据 %d",i);
    sleep(2);

    if(i == 3)
    {
        NSLog(@"完成");
        dispatch_async(dispatch_get_main_queue(), ^()/*这里一定到主线程中,下面的代码才计时的返回
                                                      while (!_isFinish)
                                                      {
                                                      [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
                                                      }*/
        {
            _isFinish = YES;
        });

    }
}
- (IBAction)button:(id)sender
{
    
}
@end
