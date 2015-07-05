//
//  WindowController.m
//  JSONConvertor
//
//  Created by c0ming on 7/5/15.
//  Copyright (c) 2015 c0ming. All rights reserved.
//

#import "WindowController.h"

#import "AppDelegate.h"

@implementation WindowController

- (void)windowDidLoad {
	((AppDelegate *)[NSApplication sharedApplication].delegate).window = self.window;
}

@end
