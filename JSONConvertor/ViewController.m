//
//  ViewController.m
//  JSONConvertor
//
//  Created by c0ming on 7/3/15.
//  Copyright (c) 2015 c0ming. All rights reserved.
//

#import "ViewController.h"

#import <Mantle.h>
#import <Masonry.h>
#import <EXTScope.h>
#import "KSJSONKit.h"

@interface ViewController ()

@property (unsafe_unretained) IBOutlet NSTextView *beforeTextView;
@property (unsafe_unretained) IBOutlet NSTextView *afterTextView;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
}

- (IBAction)convetAction:(id)sender {
	NSLog(@"%s", __func__);

	self.afterTextView.string = @"";

	id object = [self.beforeTextView.string ks_objectFromJSONString];
	if ([object isKindOfClass:[NSArray class]]) {
		[self convetArray:object forClassName:@"JSONClass"];
	} else if ([object isKindOfClass:[NSDictionary class]]) {
		[self convetObject:object forClassName:@"JSONObject"];
	}
}

- (void)convetObject:(NSDictionary *)jsonObject forClassName:(NSString *)className {
	NSMutableString *propertys = [NSMutableString string];

	for (NSString *key in jsonObject) {
		id object = jsonObject[key];

		NSString *subClassName = [self stringFromClass:[object class]];
		if ([object isKindOfClass:[NSDictionary class]]) {
			[self convetObject:object forClassName:key];

			subClassName = [NSString stringWithFormat:@"strong) %@ *", [self capitalizedFirstLetter:key]];
		} else if ([object isKindOfClass:[NSArray class]]) {
			[self convetArray:object forClassName:[NSString stringWithFormat:@"%@", key]];
		}

		[propertys appendString:[NSString stringWithFormat:@"@property (nonatomic, %@%@;\n", subClassName, key]];
	}

	className = [self capitalizedFirstLetter:className];

	NSString *newClass = [NSString stringWithFormat:@"#pragma mark - %@\n\n@interface %@ : NSObject\n\n%@\n@end\n\n", className, className, propertys];
	if (![self.afterTextView.string containsString:newClass]) {
		self.afterTextView.string = [self.afterTextView.string stringByAppendingString:newClass];
	}
}

- (void)convetArray:(NSArray *)jsonArray forClassName:(NSString *)className {
	for (id object in jsonArray) {
		if ([object isKindOfClass:[NSDictionary class]]) {
			[self convetObject:object forClassName:className];
		} else if ([object isKindOfClass:[NSArray class]]) {
			[self convetArray:jsonArray forClassName:className];
		}
        
        break;
	}
}

#pragma mark - Private Methods

- (NSString *)stringFromClass:(Class)aClass {
	NSString *className = [NSStringFromClass(aClass) lowercaseString];
	if ([className containsString:@"array"]) {
		className = @"strong) NSArray *";
	} else if ([className containsString:@"number"]) {
		className = @"strong) NSNumber *";
	} else if ([className containsString:@"boolean"]) {
		className = @"assign) BOOL ";
	} else if ([className containsString:@"string"]) {
		className = @"copy) NSString *";
	} else if ([className containsString:@"null"]) {
		className = @"strong) NSNull *";
	}

	return className;
}

- (NSString *)capitalizedFirstLetter:(NSString *)string {
	if (string.length > 0) {
		string = [string stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:[[string substringWithRange:NSMakeRange(0, 1)] uppercaseString]];
	}
	return string;
}

- (void)setRepresentedObject:(id)representedObject {
	[super setRepresentedObject:representedObject];
}

@end
