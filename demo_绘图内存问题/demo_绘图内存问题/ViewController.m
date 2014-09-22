//
//  ViewController.m
//  demo_绘图内存问题
//
//  Created by Lwgfangz on 14-7-2.
//  Copyright (c) 2014年 aiDriving.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
}
@property (nonatomic,strong) UIImageView *imageView;
@end
@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(50, 50, 100, 100) ];
    [self.view addSubview:_imageView];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated
{
    UIImage *image = [UIImage imageNamed:@"111.jpg"];
    _imageView.image = image;
    while (1)
    {
        @autoreleasepool {
            UIImage *image0 = [self imageAtRect:image size:CGRectMake(0, 0, 100, 100)];
            UIImage *image = [self scaleToSize:image0 toSize:CGSizeMake(100, 100)];

                [image retain];
                sleep(2);
                [image release];

            
        }

    }
}

//等比例缩放  : 很耗用内存 : 注意 调用     CGImageRelease(image2.CGImage); 释放
-(UIImage*)scaleToSize:(UIImage *)oldImage toSize:(CGSize)newSize
{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(newSize);
    // 绘制改变大小的图片
    [oldImage drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return scaledImage;
    
}



-(UIImage *)imageAtRect:(UIImage *)image size:(CGRect)rect
{
    
    CGImageRef imageRef = CGImageCreateWithImageInRect([image CGImage], rect);
    UIImage* subImage = [UIImage imageWithCGImage: imageRef];
    CGImageRelease(imageRef);
    
    return subImage;
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
