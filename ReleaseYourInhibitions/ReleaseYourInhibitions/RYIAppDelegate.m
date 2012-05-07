//
//  RYIAppDelegate.m
//  ReleaseYourInhibitions
//
//  Created by Brian Gesiak on 5/8/12.
//  Copyright (c) 2012 Gree, Inc. All rights reserved.
//

#import "RYIAppDelegate.h"
#import "RYIRootViewController.h"

@implementation RYIAppDelegate

@synthesize window = window_;

- (void)dealloc
{
    [window_ release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    RYIRootViewController *rootViewController = [[[RYIRootViewController alloc] init] autorelease];
    self.window.rootViewController = rootViewController;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
