//
//  Copyright (c) 2012 modocache
//
//  Permission is hereby granted, free of charge, to any person obtaining
//  a copy of this software and associated documentation files (the
//  "Software"), to deal in the Software without restriction, including
//  without limitation the rights to use, copy, modify, merge, publish,
//  distribute, sublicense, and/or sell copies of the Software, and to
//  permit persons to whom the Software is furnished to do so, subject to
//  the following conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
//  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
//  LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
//  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
//  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//


#import "AppDelegate.h"
#import "PourSugarViewController.h"


static NSString * const kAppDelegateRootViewControllerStateKey = @"AppDelegateRootViewControllerStateKey";


@interface AppDelegate ()
- (UIWindow *)buildWindow;
- (void)initializeApplication:(NSDictionary *)launchOptions;
@end


@implementation AppDelegate


#pragma mark - UIApplicationDelegate Protocol Methods

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self initializeApplication:launchOptions];
    return YES;
}

- (void)application:(UIApplication *)application willEncodeRestorableStateWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.window.rootViewController forKey:kAppDelegateRootViewControllerStateKey];
}

- (void)application:(UIApplication *)application didDecodeRestorableStateWithCoder:(NSCoder *)coder {
    UIViewController *viewController = [coder decodeObjectForKey:kAppDelegateRootViewControllerStateKey];
    if (viewController) {
        self.window = [self buildWindow];
        self.window.rootViewController = viewController;
        [self.window makeKeyAndVisible];
    }
}

- (BOOL)application:(UIApplication *)application shouldRestoreApplicationState:(NSCoder *)coder {
    return YES;
}

- (BOOL)application:(UIApplication *)application shouldSaveApplicationState:(NSCoder *)coder {
    return YES;
}


#pragma mark - Internal Methods

- (UIWindow *)buildWindow {
    UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    window.restorationIdentifier = NSStringFromClass([self.window class]);
    return window;
}

- (void)initializeApplication:(NSDictionary *)launchOptions {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!self.window) {
            self.window = [self buildWindow];
            self.window.rootViewController = [PourSugarViewController new];
            [self.window makeKeyAndVisible];
        }
    });
}

@end
