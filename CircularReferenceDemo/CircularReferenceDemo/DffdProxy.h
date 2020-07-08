//
//  DffdProxy.h
//  CircularReferenceDemo
//
//  Created by king on 2020/7/8.
//  Copyright © 2020 kingsely. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DffdProxy : NSProxy

+ (instancetype)proxyWithTarget:(id)target;

@end

NS_ASSUME_NONNULL_END
