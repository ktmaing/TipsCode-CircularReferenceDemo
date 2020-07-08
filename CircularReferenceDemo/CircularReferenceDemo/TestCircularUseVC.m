//
//  TestCircularUseVC.m
//  CircularReferenceDemo
//
//  Created by king on 2020/7/8.
//  Copyright © 2020 kingsely. All rights reserved.
//

#import "TestCircularUseVC.h"

#import <Foundation/NSTimer.h>

#import "DffdProxy.h"
#import "DffdProxyObject.h"

@interface TestCircularUseVC ()

@property (nonatomic, strong) CADisplayLink     *link;
@property (nonatomic, strong) NSTimer           *timer;

@end

/**
 * 总结：
 * 若CADisplayLink/NSTimer 的target直接使用self，则会产生循环引用；
 * 原因：target内部使用了强引用，指向当前self，这时就成了循环引用
 *
 * 解决方法：
 * 1、NSTimer 使用block
 * 2、使用中间代理转换，如DffdProxy/DffdProxyObject
 *
 * 使用NSProxy好处：不会在父类中寻找方法，提高效率
 */
@implementation TestCircularUseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /**
     * CADisplayLink、NSTimer会对target产生强引用，如果target又对它们产生强引用，那么就会引发循环引用；
     */
//    self.link = [CADisplayLink displayLinkWithTarget:self selector:@selector(TestLink)];
//    [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
//
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(TestTimer) userInfo:nil repeats:YES];
    
    
//    self.link = [CADisplayLink displayLinkWithTarget:[DffdProxy proxyWithTarget:self] selector:@selector(TestLink)];
//    [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(TestTimer) userInfo:nil repeats:YES];
    
    __weak typeof (self) weaself = self;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f repeats:YES block:^(NSTimer * _Nonnull timer) {
        
        [weaself TestTimer];
    }];
}

- (void)TestLink {
    
    NSLog(@"%s", __func__);
}

- (void)TestTimer {
    
    NSLog(@"%s", __func__);
}

- (void)dealloc {
    
    NSLog(@"%s  dealloc", __func__);
    
    if ( _link ) {
        
        NSLog(@"link invalidate");
        [self.link invalidate];
        self.link = nil;
    }
    
    if ( _timer ) {
        
        NSLog(@"Timer invalidate");
        [self.timer invalidate];
        self.timer = nil;
    }
}

@end
