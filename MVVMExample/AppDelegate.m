//
//  AppDelegate.m
//  MVVMExample
//
//  Created by Martin Richter on 28/04/16.
//  Copyright © 2016 Futurice. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [[TSLManager sharedInstance] tslInitWithDebugLevel:TSL_DEBUG_LEVEL_ALL];

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    RootViewController *svc = [[RootViewController alloc] init];
    
    [self.window setRootViewController:svc];
    
    [self.window makeKeyAndVisible];
    
    [AlertProcessView show];

    return YES;
}

@end
