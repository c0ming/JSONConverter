//
//  KSItemInfoModel.m
//  JSONConvertor
//
//  Created by c0ming on 7/5/15.
//  Copyright (c) 2015 c0ming. All rights reserved.
//

#import "KSItemInfoModel.h"

// ------------ Implementation ------------

#pragma mark - EvaluateInfo

@implementation EvaluateInfo

@end

#pragma mark - ActionUnits

@implementation ActionUnits

@end

#pragma mark - Seller

@implementation Seller

+ (NSValueTransformer *)evaluateInfoJSONTransformer {
	return [MTLJSONAdapter arrayTransformerWithModelClass:[EvaluateInfo class]];
}

+ (NSValueTransformer *)actionUnitsJSONTransformer {
	return [MTLJSONAdapter arrayTransformerWithModelClass:[ActionUnits class]];
}

@end

#pragma mark - ItemInfoModel

@implementation ItemInfoModel

@end

#pragma mark - DescInfo

@implementation DescInfo

@end

#pragma mark - Extras

@implementation Extras

@end

#pragma mark - AsynUrl

@implementation AsynUrl

@end

#pragma mark - H5Url

@implementation H5Url

@end

#pragma mark - ComboInfo

@implementation ComboInfo

+ (NSValueTransformer *)asynUrlJSONTransformer {
	return [MTLJSONAdapter dictionaryTransformerWithModelClass:[AsynUrl class]];
}

+ (NSValueTransformer *)h5UrlJSONTransformer {
	return [MTLJSONAdapter dictionaryTransformerWithModelClass:[H5Url class]];
}

@end

#pragma mark - ApiStack

@implementation ApiStack

@end

#pragma mark - TagList

@implementation TagList

@end

#pragma mark - RateDetailList

@implementation RateDetailList

@end

#pragma mark - RateInfo

@implementation RateInfo

+ (NSValueTransformer *)tagListJSONTransformer {
	return [MTLJSONAdapter arrayTransformerWithModelClass:[TagList class]];
}

+ (NSValueTransformer *)rateDetailListJSONTransformer {
	return [MTLJSONAdapter arrayTransformerWithModelClass:[RateDetailList class]];
}

@end

#pragma mark - ReplaceDataMap

@implementation ReplaceDataMap

@end

#pragma mark - LayoutData

@implementation LayoutData

+ (NSValueTransformer *)replaceDataMapJSONTransformer {
	return [MTLJSONAdapter dictionaryTransformerWithModelClass:[ReplaceDataMap class]];
}

@end

#pragma mark - TrackParams

@implementation TrackParams

@end

#pragma mark - Params

@implementation Params

@end

#pragma mark - MtopModel

@implementation MtopModel

+ (NSValueTransformer *)paramsJSONTransformer {
	return [MTLJSONAdapter dictionaryTransformerWithModelClass:[Params class]];
}

@end

#pragma mark - WeappList

@implementation WeappList

+ (NSValueTransformer *)mtopModelJSONTransformer {
	return [MTLJSONAdapter dictionaryTransformerWithModelClass:[MtopModel class]];
}

@end

#pragma mark - Props

@implementation Props

@end

#pragma mark - Data

@implementation Data

+ (NSValueTransformer *)sellerJSONTransformer {
	return [MTLJSONAdapter dictionaryTransformerWithModelClass:[Seller class]];
}

+ (NSValueTransformer *)itemInfoModelJSONTransformer {
	return [MTLJSONAdapter dictionaryTransformerWithModelClass:[ItemInfoModel class]];
}

+ (NSValueTransformer *)descInfoJSONTransformer {
	return [MTLJSONAdapter dictionaryTransformerWithModelClass:[DescInfo class]];
}

+ (NSValueTransformer *)extrasJSONTransformer {
	return [MTLJSONAdapter dictionaryTransformerWithModelClass:[Extras class]];
}

+ (NSValueTransformer *)comboInfoJSONTransformer {
	return [MTLJSONAdapter dictionaryTransformerWithModelClass:[ComboInfo class]];
}

+ (NSValueTransformer *)apiStackJSONTransformer {
	return [MTLJSONAdapter arrayTransformerWithModelClass:[ApiStack class]];
}

+ (NSValueTransformer *)rateInfoJSONTransformer {
	return [MTLJSONAdapter dictionaryTransformerWithModelClass:[RateInfo class]];
}

+ (NSValueTransformer *)layoutDataJSONTransformer {
	return [MTLJSONAdapter dictionaryTransformerWithModelClass:[LayoutData class]];
}

+ (NSValueTransformer *)trackParamsJSONTransformer {
	return [MTLJSONAdapter dictionaryTransformerWithModelClass:[TrackParams class]];
}

+ (NSValueTransformer *)weappListJSONTransformer {
	return [MTLJSONAdapter arrayTransformerWithModelClass:[WeappList class]];
}

+ (NSValueTransformer *)propsJSONTransformer {
	return [MTLJSONAdapter arrayTransformerWithModelClass:[Props class]];
}

@end

#pragma mark - KSItemInfoModel

@implementation KSItemInfoModel

+ (NSValueTransformer *)dataJSONTransformer {
	return [MTLJSONAdapter dictionaryTransformerWithModelClass:[Data class]];
}

@end
