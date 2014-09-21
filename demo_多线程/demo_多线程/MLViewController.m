//
//  MLViewController.m
//  demo_多线程
//
//  Created by Lwgfangz on 14-7-13.
//  Copyright (c) 2014年 Lwgfangz. All rights reserved.
//

#import "MLViewController.h"

@interface MLViewController ()
{
}
@property (nonatomic,assign)int total;
@property (atomic,strong)dispatch_queue_t queue;

@end

@implementation MLViewController
@synthesize total;

-(int)total
{
    __block int temp;
    dispatch_async(_queue,
                   ^{
                       temp = total;
                   });
    return temp;
}

-(void)setTotal:(int)t
{
    dispatch_barrier_async(_queue,
    ^{
        total = t;
    });
}


- (void)viewDidLoad
{
    _queue = dispatch_queue_create("MyQueue", 0);
    total = 100;
    [super viewDidLoad];
    dispatch_barrier_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),
    ^{
        while(total>0)
        {
            dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0), ^()
            {
 s
                NSLog(@"1===%d",total);
                //sleep(3);
                total--;
            });


        }

    });
    dispatch_barrier_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),
                   ^{
                       while(total>0)
                       {
                           dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0), ^()
                                         {

                                             NSLog(@"2===%d",total);
                                             //sleep(3);
                                             total--;
                                         });



                       }
                   });
    dispatch_barrier_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),
                   ^{
                       while(total>0)
                       {

                           dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0), ^()
                                         {

                                             NSLog(@"3===%d",total);
                                             //sleep(3);
                                             total--;
                                         });

                       }
                   });
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
