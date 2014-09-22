//
//  ViewController.m
//  demo
//
//  Created by Lwgfangz on 14-6-23.
//  Copyright (c) 2014年 aiDriving.com. All rights reserved.
//

#import "ViewController.h"
#import "AICamera.h"
#import "AICameraLib.h"
@interface ViewController ()
@property (nonatomic,strong)AICamera *camera;
@property (weak, nonatomic) IBOutlet UILabel *lable;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    self.camera = [AICamera cameraWithType:CAMERA_TYPE_WIFI];
    _lable.text = @"";
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)open:(id)sender
{
    _lable.text = @"正在打开...";
    OpSuccess success = ^(id obj)
    {
        _lable.text = @"已经打开";
        _lable.textColor = [UIColor greenColor];
        NSLog(@"open success!");
    };
    OpFailure failure = ^(NSError*error)
    {
        _lable.text = @"打开失败";
        NSLog(@"open faile!");
    };
    [_camera open:success failure:failure];
}
- (IBAction)realplay:(id)sender
{
    OpSuccess success = ^(id obj)
    {
        if([obj isKindOfClass:[UIImage class]])
        {
            UIImage *image = (UIImage *)obj;
            _imageView.image = image;
            _lable.text = @"正在预览";
        }
        
    };
    OpFailure failure = ^(NSError*error)
    {
        NSLog(@"realplay faile!");
    };
    [_camera startCapture:success failure:failure];
}
- (IBAction)stopRealPlay:(id)sender
{
    _lable.text = @"停止预览";
    OpSuccess success = ^(id obj)
    {
        _imageView.image = nil;
        _lable.text = @"已经打开";
    };
    OpFailure failure = ^(NSError*error)
    {
        NSLog(@"stop faile!");
    };
    [_camera stopCapture:success failure:failure];
}
- (IBAction)record:(id)sender
{
    OpSuccess success = ^(id obj)
    {
        _lable.text = @"开始录像";
    };
    OpFailure failure = ^(NSError*error)
    {
        _lable.text = @"已经打开";
    };
    [_camera startRecord:nil success:success failure:failure];
}

- (IBAction)stopRecord:(id)sender
{
    OpSuccess success = ^(id obj)
    {

    };
    OpFailure failure = ^(NSError*error)
    {

    };
    [_camera stopRecord:success failure:failure];
}
- (IBAction)takePhoto:(id)sender
{
    OpSuccess success = ^(id obj)
    {
        NSLog(@"拍照成功!");
    };
    OpFailure failure = ^(NSError*error)
    {
        NSLog(@"拍照失败!");
    };
    [_camera takePhoto:nil success:success failure:failure];
}
- (IBAction)fileList:(id)sender
{
    OpSuccess success = ^(id obj)
    {
        if([obj isKindOfClass:[NSArray class]])
        {
            NSArray *array = (NSArray *)obj;
            NSLog(@"%@",array);
        }
    };
    OpFailure failure = ^(NSError*error)
    {
        NSLog(@"");
    };
    [_camera getFiles:success failure:failure];
}
- (IBAction)close:(id)sender
{
    OpSuccess success = ^(id obj)
    {

    };
    OpFailure failure = ^(NSError*error)
    {

    };
    [_camera close:success failure:failure];
}

@end
