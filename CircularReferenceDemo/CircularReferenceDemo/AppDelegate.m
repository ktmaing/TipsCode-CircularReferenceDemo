//
//  AppDelegate.m
//  CircularReferenceDemo
//
//  Created by king on 2020/7/8.
//  Copyright © 2020 kingsely. All rights reserved.
//

#import "AppDelegate.h"
#import "MainVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    if ( _window ) {
        
        _window.frame = [[UIScreen mainScreen] bounds];
    } else {
        
        _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    }
    
    [self.window makeKeyAndVisible];
    
    MainVC *ctrl = [[MainVC alloc] init];
    
    UINavigationController *navCtrl = [[UINavigationController alloc] initWithRootViewController:ctrl];
    
    self.window.rootViewController = navCtrl;
    
    return YES;
}


@end
