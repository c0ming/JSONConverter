//
//  KSJSONKit.m
//  QMall
//
//  Created by c0ming on 15/5/4.
//  Copyright (c) 2015年 KanS. All rights reserved.
//

#import "KSJSONKit.h"

#pragma mark - Foundation objects to JSON

static NSString *const NSJSONKitErrorDomain = @"cn.kans.JSONKit";

@implementation NSObject (JSONKit)

- (NSString *)ks_JSONString {
	// If that option is not set, the most compact possible JSON will be generated.
	// or NSJSONWritingPrettyPrinted option will generate JSON with whitespace designed to make the output more readable
	return [self ks_JSONStringWithOptions:0 error:NULL];
}

- (NSString *)ks_JSONStringWithOptions:(NSJSONWritingOptions)opt error:(NSError **)error {
	NSString *JSONString = nil;
	NSData *JSONData = [self ks_JSONDataWithOptions:opt error:error];
	if (JSONData != nil) {
		JSONString = [[NSString alloc] initWithData:JSONData encoding:NSUTF8StringEncoding];
	}

	return JSONString;
}

- (NSData *)ks_JSONData {
	return [self ks_JSONDataWithOptions:0 error:NULL];
}

- (NSData *)ks_JSONDataWithOptions:(NSJSONWritingOptions)opt error:(NSError **)error {
	NSData *JSONData = nil;

	// If obj will not produce valid JSON, an exception is thrown.
	// This exception is thrown prior to parsing and represents a programming error, not an internal error.
	if ([NSJSONSerialization isValidJSONObject:self]) {
		JSONData = [NSJSONSerialization dataWithJSONObject:self options:opt error:error];
	} else {
		if (error) {
			*error = [NSError errorWithDomain:NSJSONKitErrorDomain
			                             code:-1
			                         userInfo:@{ NSLocalizedFailureReasonErrorKey:@"This is not a valid JSONObject" }];
		}
	}

	return JSONData;
}

@end

#pragma mark - JSON to Foundation objects

@implementation NSString (JSONKit)

- (id)ks_objectFromJSONString {
	return [self ks_objectFromJSONStringWithOptions:0 error:NULL];
}

- (id)ks_mutableObjectFromJSONString {
	return [self ks_objectFromJSONStringWithOptions:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:NULL];
}

- (id)ks_objectFromJSONStringWithOptions:(NSJSONReadingOptions)opt error:(NSError **)error {
	NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
	return [data ks_objectFromJSONDataWithOptions:opt error:error];
}

@end

@implementation NSData (JSONKit)

- (id)ks_objectFromJSONData {
	return [self ks_objectFromJSONDataWithOptions:0 error:NULL];
}

- (id)ks_mutableObjectFromJSONData {
	return [self ks_objectFromJSONDataWithOptions:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:NULL];
}

- (id)ks_objectFromJSONDataWithOptions:(NSJSONReadingOptions)opt error:(NSError **)error {
	return [NSJSONSerialization JSONObjectWithData:self options:opt error:error];
}

@end
