//
//  KSJSONKit.h
//  QMall
//
//  Created by c0ming on 15/5/4.
//  Copyright (c) 2015年 KanS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (JSONKit)

- (NSString *)ks_JSONString;
- (NSString *)ks_JSONStringWithOptions:(NSJSONWritingOptions)opt error:(NSError **)error;
- (NSData *)ks_JSONData;
- (NSData *)ks_JSONDataWithOptions:(NSJSONWritingOptions)opt error:(NSError **)error;

@end

@interface NSString (JSONKit)

- (id)ks_objectFromJSONString;
- (id)ks_mutableObjectFromJSONString;
- (id)ks_objectFromJSONStringWithOptions:(NSJSONReadingOptions)opt error:(NSError **)error;

@end

@interface NSData (JSONKit)

- (id)ks_objectFromJSONData;
- (id)ks_mutableObjectFromJSONData;
- (id)ks_objectFromJSONDataWithOptions:(NSJSONReadingOptions)opt error:(NSError **)error;

@end
