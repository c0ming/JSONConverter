//
//  KSBaseModel.m
//  JSONConvertor
//
//  Created by c0ming on 7/4/15.
//  Copyright (c) 2015 c0ming. All rights reserved.
//

#import "KSBaseModel.h"

@implementation KSBaseModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return [NSDictionary mtl_identityPropertyMapWithModel:self];
}

@end
