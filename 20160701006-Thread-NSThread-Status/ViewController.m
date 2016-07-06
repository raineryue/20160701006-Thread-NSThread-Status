//
//  ViewController.m
//  20160701006-Thread-NSThread-Status
//
//  Created by Rainer on 16/7/6.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [NSThread detachNewThreadSelector:@selector(threadRunAction:) toTarget:self withObject:@"Jack"];
}

- (void)threadRunAction:(NSString *)parmas {
//    [self sleepStatus:parmas];

    [self exitsStatus:parmas];
}

- (void)exitsStatus:(NSString *)parmas {
    for (NSInteger i = 0; i < 50; i++) {
        NSLog(@"===================>[%@] do something in [%ld] seconds.", parmas, i);
        
        if (i == 25) {
            NSLog(@"===================>[%@] sleep [%f] seconds.", parmas, 2.0);
            
            [NSThread sleepForTimeInterval:2.0];
            
            NSLog(@"===================>[%@] do something in [%ld] seconds agin.", parmas, i);
        }
        
        if (i == 49) {
            NSLog(@"===================>[%@] exit do something", parmas);
            
            // 退出线程
            [NSThread exit];
            
            // 也可用
//            break;
//            return;
            
            // 不可用以下方法：这个方法是用来推出应用程序的
//            exit(<#int#>)
        }
    }
}

- (void)sleepStatus:(NSString *)parmas {
    NSLog(@"===================>[%@] doing something.", parmas);
    
    // 方法1:线程睡眠2秒钟(实际上是2秒钟)
//    [NSThread sleepForTimeInterval:2.0];
    
    // 方法2:线程从当前时间睡眠2秒钟（实际上是3秒钟）
//    [NSThread sleepUntilDate:[NSDate dateWithTimeIntervalSinceNow:2.0]];
    
    // 方法3:线程从当前时间睡眠到遥远的未来
    NSLog(@"===================>%@", [NSDate distantFuture]);
    
    [NSThread sleepUntilDate:[NSDate distantFuture]];
    
    NSLog(@"===================>[%@] done something.", parmas);
}

@end
