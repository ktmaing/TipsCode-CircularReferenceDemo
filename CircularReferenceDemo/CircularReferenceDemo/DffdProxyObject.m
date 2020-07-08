//
//  DffdProxyObject.m
//  CircularReferenceDemo
//
//  Created by king on 2020/7/8.
//  Copyright © 2020 kingsely. All rights reserved.
//

#import "DffdProxyObject.h"


@interface DffdProxyObject()

@property (weak, nonatomic) id  target;

@end

@implementation DffdProxyObject
+ (instancetype)proxyWithTarget:(id)target {
    
    DffdProxyObject *object = [[DffdProxyObject alloc] init];
    
    object.target = target;
    
    return object;
    
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    
    NSLog(@"forwardingTargetForSelector");
    
    return self.target;
}

@end
