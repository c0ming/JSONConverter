//
//  AppDelegate.m
//  JSONConvertor
//
//  Created by c0ming on 7/3/15.
//  Copyright (c) 2015 c0ming. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	[self.window setContentSize:NSMakeSize(960, 640)];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
	// Insert code here to tear down your application
}

- (BOOL)applicationShouldHandleReopen:(NSApplication *)sender hasVisibleWindows:(BOOL)flag {
	if (flag) {
		return NO;
	} else {
		[self.window makeKeyAndOrderFront:self];
		return YES;
	}
}

@end
