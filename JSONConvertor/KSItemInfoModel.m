//
//  KSItemInfoModel.m
//  JSONConvertor
//
//  Created by c0ming on 7/5/15.
//  Copyright (c) 2015 c0ming. All rights reserved.
//

#import "KSItemInfoModel.h"

// ----------- Separator Line  -----------

#pragma mark - EvaluateInfo

@implementation EvaluateInfo

@end

#pragma mark - ActionUnits

@implementation ActionUnits

@end

#pragma mark - Seller

@implementation Seller

+ (NSValueTransformer *)EvaluateInfoJSONTransformer {
	return [MTLJSONAdapter arrayTransformerWithModelClass:[EvaluateInfo class]];
}

+ (NSValueTransformer *)ActionUnitsJSONTransformer {
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

+ (NSValueTransformer *)AsynUrlJSONTransformer {
	return [MTLJSONAdapter dictionaryTransformerWithModelClass:[AsynUrl class]];
}

+ (NSValueTransformer *)H5UrlJSONTransformer {
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

+ (NSValueTransformer *)TagListJSONTransformer {
	return [MTLJSONAdapter arrayTransformerWithModelClass:[TagList class]];
}

+ (NSValueTransformer *)RateDetailListJSONTransformer {
	return [MTLJSONAdapter arrayTransformerWithModelClass:[RateDetailList class]];
}

@end

#pragma mark - ReplaceDataMap

@implementation ReplaceDataMap

@end

#pragma mark - LayoutData

@implementation LayoutData

+ (NSValueTransformer *)ReplaceDataMapJSONTransformer {
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

+ (NSValueTransformer *)ParamsJSONTransformer {
	return [MTLJSONAdapter dictionaryTransformerWithModelClass:[Params class]];
}

@end

#pragma mark - WeappList

@implementation WeappList

+ (NSValueTransformer *)MtopModelJSONTransformer {
	return [MTLJSONAdapter dictionaryTransformerWithModelClass:[MtopModel class]];
}

@end

#pragma mark - Props

@implementation Props

@end

#pragma mark - Data

@implementation Data

+ (NSValueTransformer *)SellerJSONTransformer {
	return [MTLJSONAdapter dictionaryTransformerWithModelClass:[Seller class]];
}

+ (NSValueTransformer *)ItemInfoModelJSONTransformer {
	return [MTLJSONAdapter dictionaryTransformerWithModelClass:[ItemInfoModel class]];
}

+ (NSValueTransformer *)DescInfoJSONTransformer {
	return [MTLJSONAdapter dictionaryTransformerWithModelClass:[DescInfo class]];
}

+ (NSValueTransformer *)ExtrasJSONTransformer {
	return [MTLJSONAdapter dictionaryTransformerWithModelClass:[Extras class]];
}

+ (NSValueTransformer *)ComboInfoJSONTransformer {
	return [MTLJSONAdapter dictionaryTransformerWithModelClass:[ComboInfo class]];
}

+ (NSValueTransformer *)ApiStackJSONTransformer {
	return [MTLJSONAdapter arrayTransformerWithModelClass:[ApiStack class]];
}

+ (NSValueTransformer *)RateInfoJSONTransformer {
	return [MTLJSONAdapter dictionaryTransformerWithModelClass:[RateInfo class]];
}

+ (NSValueTransformer *)LayoutDataJSONTransformer {
	return [MTLJSONAdapter dictionaryTransformerWithModelClass:[LayoutData class]];
}

+ (NSValueTransformer *)TrackParamsJSONTransformer {
	return [MTLJSONAdapter dictionaryTransformerWithModelClass:[TrackParams class]];
}

+ (NSValueTransformer *)WeappListJSONTransformer {
	return [MTLJSONAdapter arrayTransformerWithModelClass:[WeappList class]];
}

+ (NSValueTransformer *)PropsJSONTransformer {
	return [MTLJSONAdapter arrayTransformerWithModelClass:[Props class]];
}

@end

#pragma mark - KSItemInfoModel

@implementation KSItemInfoModel

+ (NSValueTransformer *)DataJSONTransformer {
	return [MTLJSONAdapter dictionaryTransformerWithModelClass:[Data class]];
}

@end
