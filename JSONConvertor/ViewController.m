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
#import "KSItemInfoModel.h"

@interface ViewController ()

@property (unsafe_unretained) IBOutlet NSTextView *beforeTextView;
@property (unsafe_unretained) IBOutlet NSTextView *afterTextView;

@property (nonatomic, strong) NSMutableString *interfaceString;
@property (nonatomic, strong) NSMutableString *implementaionString;

@end

@implementation ViewController

#pragma mark - Setup

- (void)setup {
	self.interfaceString = [[NSMutableString alloc] init];
	self.implementaionString = [[NSMutableString alloc] init];
}

#pragma mark - Actions

- (IBAction)convetAction:(id)sender {
	NSLog(@"%s", __func__);

	[self.interfaceString setString:@""];
	[self.implementaionString setString:@""];

	id object = [self.beforeTextView.string ks_objectFromJSONString];
	if ([object isKindOfClass:[NSArray class]]) {
		[self convetArray:object forClassName:@"RootClass"];
	} else if ([object isKindOfClass:[NSDictionary class]]) {
		[self convetObject:object forClassName:@"RootClass"];
	}

	NSMutableString *resultString = [NSMutableString string];
	[resultString appendString:@"// ------------ Interface ------------ \n\n"];
	[resultString appendString:self.interfaceString];
	[resultString appendString:@"// ---------- Implementation --------- \n\n"];
	[resultString appendString:self.implementaionString];

	self.afterTextView.string = resultString;
}

#pragma mark -

- (void)viewDidLoad {
	[super viewDidLoad];

	[self setup];

	// demo
	NSString *itemInfoString = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"item_info" ofType:@"json"] encoding:NSUTF8StringEncoding error:NULL];

	NSError *error;
	KSItemInfoModel *itemInfoModel = [MTLJSONAdapter modelOfClass:[KSItemInfoModel class] fromJSONDictionary:[itemInfoString ks_objectFromJSONString] error:&error];
	if (error) {
		NSLog(@"%@", error);
	} else {
		NSLog(@"%@", itemInfoModel.data.itemInfoModel.picsPath[0]);
	}
}

#pragma mark - Convert Methods

- (void)convetObject:(NSDictionary *)jsonObject forClassName:(NSString *)className {
	className = [self capitalizedFirstLetter:className];

	NSMutableString *propertys = [NSMutableString string];
	NSMutableString *transformers = [NSMutableString string];

	for (NSString *key in jsonObject) {
		id object = jsonObject[key];

		NSString *property = [self propertyOfObject:object];
		if ([object isKindOfClass:[NSDictionary class]]) {
			[self convetObject:object forClassName:key];

			property = [NSString stringWithFormat:@"strong) %@ *", [self capitalizedFirstLetter:key]];

			[transformers appendFormat:@"+ (NSValueTransformer *)%@JSONTransformer {\n\treturn [MTLJSONAdapter dictionaryTransformerWithModelClass:[%@ class]];\n}\n\n", key, [self capitalizedFirstLetter:key]];
		} else if ([object isKindOfClass:[NSArray class]]) {
			[self convetArray:object forClassName:[NSString stringWithFormat:@"%@", key]];

			NSArray *array = (NSArray *)object;
			// if element in the array is object
			if (array.count > 0 && [array[0] isKindOfClass:[NSDictionary class]]) {
				[transformers appendFormat:@"+ (NSValueTransformer *)%@JSONTransformer {\n\treturn [MTLJSONAdapter arrayTransformerWithModelClass:[%@ class]];\n}\n\n", key, [self capitalizedFirstLetter:key]];
			}
		}

		[propertys appendString:[NSString stringWithFormat:@"@property (nonatomic, %@%@;\n", property, key]];
	}

	NSString *newInterface = [NSString stringWithFormat:@"#pragma mark - %@\n\n@interface %@ : KSBaseModel\n\n%@\n@end\n\n", className, className, propertys];
	if (![self.interfaceString containsString:newInterface]) {
		[self.interfaceString appendString:newInterface];
		[self.implementaionString appendString:[NSString stringWithFormat:@"#pragma mark - %@\n\n@implementation %@\n\n%@@end\n\n", className, className, transformers]];
	}
}

- (void)convetArray:(NSArray *)jsonArray forClassName:(NSString *)className {
	for (id object in jsonArray) {
		if ([object isKindOfClass:[NSDictionary class]]) {
			[self convetObject:object forClassName:className];
		} else if ([object isKindOfClass:[NSArray class]]) {
			[self convetArray:jsonArray forClassName:className];
		}

		// assume the element in array is same
		break;
	}
}

#pragma mark - Private Methods

- (NSString *)stringFromClass:(Class)aClass {
	NSString *className = [NSStringFromClass(aClass) lowercaseString];
	NSLog(@">>> %@", className);
	if ([className containsString:@"array"]) {
		className = @"strong) NSArray *";
	} else if ([className containsString:@"number"]) {
		className = @"strong) NSNumber *";
	} else if ([className containsString:@"boolean"]) {
		className = @"assign) BOOL ";
	} else if ([className containsString:@"string"] || [className containsString:@"null"]) {
		className = @"copy) NSString *";
	}

	return className;
}

- (NSString *)propertyOfObject:(id)object {
	NSString *className = [NSStringFromClass([object class]) lowercaseString];
	NSLog(@">>> %@", className);
	NSString *property = nil;
	if ([className containsString:@"array"]) {
		property = @"strong) NSArray *";
	} else if ([className containsString:@"number"]) {
		if (CFNumberIsFloatType((CFNumberRef)object)) {
			property = @"assign) CGFloat ";
		} else {
			property = @"assign) NSInteger ";
		}
	} else if ([className containsString:@"boolean"]) {
		property = @"assign) BOOL ";
	} else if ([className containsString:@"string"] || [className containsString:@"null"]) {
		property = @"copy) NSString *";
	}

	return property;
}

- (NSString *)capitalizedFirstLetter:(NSString *)string {
	if (string.length > 0) {
		string = [string stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:[[string substringWithRange:NSMakeRange(0, 1)] uppercaseString]];
	}
	return string;
}

#pragma mark -

- (void)setRepresentedObject:(id)representedObject {
	[super setRepresentedObject:representedObject];
}

@end
