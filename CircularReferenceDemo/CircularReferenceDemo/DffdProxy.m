//
//  DffdProxy.m
//  CircularReferenceDemo
//
//  Created by king on 2020/7/8.
//  Copyright © 2020 kingsely. All rights reserved.
//

#import "DffdProxy.h"

@interface DffdProxy()

@property (nonatomic, weak) id      target;

@end
@implementation DffdProxy
+ (instancetype)proxyWithTarget:(id)target {
    
    DffdProxy *object = [DffdProxy alloc];
    
    object.target = target;
    
    return object;
    
}


- (void)forwardInvocation:(NSInvocation *)invocation {

    NSLog(@"forwardInvocation");
    [invocation invokeWithTarget:self.target];
}

- (nullable NSMethodSignature *)methodSignatureForSelector:(SEL)sel {

    NSLog(@"methodSignatureForSelector");
    return [self.target methodSignatureForSelector:sel];
}


@end
