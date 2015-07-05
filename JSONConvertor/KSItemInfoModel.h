//
//  KSItemInfoModel.h
//  JSONConvertor
//
//  Created by c0ming on 7/5/15.
//  Copyright (c) 2015 c0ming. All rights reserved.
//

#import "KSBaseModel.h"

#pragma mark - EvaluateInfo

@interface EvaluateInfo : KSBaseModel

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *score;
@property (nonatomic, copy) NSString *highGap;

@end

#pragma mark - ActionUnits

@interface ActionUnits : KSBaseModel

@property (nonatomic, copy) NSString *value;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *track;

@end

#pragma mark - Seller

@interface Seller : KSBaseModel

@property (nonatomic, copy) NSString *shopTitle;
@property (nonatomic, copy) NSString *fansCount;
@property (nonatomic, copy) NSString *shopPromtionType;
@property (nonatomic, copy) NSString *starts;
@property (nonatomic, strong) NSArray *evaluateInfo;
@property (nonatomic, copy) NSString *picUrl;
@property (nonatomic, strong) NSArray *actionUnits;
@property (nonatomic, copy) NSString *nick;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *fansCountText;
@property (nonatomic, copy) NSString *userNumId;
@property (nonatomic, copy) NSString *shopId;
@property (nonatomic, copy) NSString *creditLevel;
@property (nonatomic, copy) NSString *goodRatePercentage;
@property (nonatomic, copy) NSString *weitaoId;

@end

#pragma mark - ItemInfoModel

@interface ItemInfoModel : KSBaseModel

@property (nonatomic, copy) NSString *categoryId;
@property (nonatomic, copy) NSString *favcount;
@property (nonatomic, copy) NSString *itemIcon;
@property (nonatomic, assign) BOOL sku;
@property (nonatomic, strong) NSArray *picsPath;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *stuffStatus;
@property (nonatomic, copy) NSString *location;
@property (nonatomic, copy) NSString *itemTypeLogo;
@property (nonatomic, copy) NSString *itemUrl;
@property (nonatomic, copy) NSString *itemTypeName;
@property (nonatomic, copy) NSString *saleLine;
@property (nonatomic, copy) NSString *itemId;

@end

#pragma mark - DescInfo

@interface DescInfo : KSBaseModel

@property (nonatomic, copy) NSString *h5DescUrl;
@property (nonatomic, copy) NSString *fullDescUrl;
@property (nonatomic, copy) NSString *showFullDetailDesc;
@property (nonatomic, copy) NSString *h5DescUrl2;
@property (nonatomic, copy) NSString *briefDescUrl;
@property (nonatomic, copy) NSString *pcDescUrl;

@end

#pragma mark - Extras

@interface Extras : KSBaseModel

@property (nonatomic, copy) NSString *defDyn;

@end

#pragma mark - AsynUrl

@interface AsynUrl : KSBaseModel

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *value;

@end

#pragma mark - H5Url

@interface H5Url : KSBaseModel

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *value;

@end

#pragma mark - ComboInfo

@interface ComboInfo : KSBaseModel

@property (nonatomic, strong) AsynUrl *asynUrl;
@property (nonatomic, strong) H5Url *h5Url;

@end

#pragma mark - ApiStack

@interface ApiStack : KSBaseModel

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *value;

@end

#pragma mark - TagList

@interface TagList : KSBaseModel

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *count;
@property (nonatomic, copy) NSString *attribute;
@property (nonatomic, copy) NSString *score;

@end

#pragma mark - RateDetailList

@interface RateDetailList : KSBaseModel

@property (nonatomic, copy) NSString *headPic;
@property (nonatomic, copy) NSString *nick;
@property (nonatomic, copy) NSString *feedback;
@property (nonatomic, copy) NSString *star;

@end

#pragma mark - RateInfo

@interface RateInfo : KSBaseModel

@property (nonatomic, strong) NSArray *tagList;
@property (nonatomic, strong) NSArray *rateDetailList;
@property (nonatomic, copy) NSString *rateCounts;

@end

#pragma mark - ReplaceDataMap

@interface ReplaceDataMap : KSBaseModel

@property (nonatomic, copy) NSString *SELLER_ID;
@property (nonatomic, copy) NSString *SHOP_ID;
@property (nonatomic, copy) NSString *ITEM_ID;

@end

#pragma mark - LayoutData

@interface LayoutData : KSBaseModel

@property (nonatomic, strong) ReplaceDataMap *replaceDataMap;

@end

#pragma mark - TrackParams

@interface TrackParams : KSBaseModel

@property (nonatomic, copy) NSString *BC_type;
@property (nonatomic, copy) NSString *categoryId;
@property (nonatomic, copy) NSString *brandId;

@end

#pragma mark - Params

@interface Params : KSBaseModel

@property (nonatomic, copy) NSString *sellerId;
@property (nonatomic, copy) NSString *jumpUrl;
@property (nonatomic, copy) NSString *itemId;

@end

#pragma mark - MtopModel

@interface MtopModel : KSBaseModel

@property (nonatomic, copy) NSString *VERSION;
@property (nonatomic, copy) NSString *API_NAME;
@property (nonatomic, strong) Params *params;
@property (nonatomic, assign) BOOL needLogin;
@property (nonatomic, assign) BOOL needEcode;

@end

#pragma mark - WeappList

@interface WeappList : KSBaseModel

@property (nonatomic, strong) MtopModel *mtopModel;
@property (nonatomic, copy) NSString *identifier;

@end

#pragma mark - Props

@interface Props : KSBaseModel

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *value;

@end

#pragma mark - Data

@interface Data : KSBaseModel

@property (nonatomic, strong) Seller *seller;
@property (nonatomic, strong) ItemInfoModel *itemInfoModel;
@property (nonatomic, strong) DescInfo *descInfo;
@property (nonatomic, strong) Extras *extras;
@property (nonatomic, strong) ComboInfo *comboInfo;
@property (nonatomic, strong) NSArray *apiStack;
@property (nonatomic, strong) RateInfo *rateInfo;
@property (nonatomic, strong) LayoutData *layoutData;
@property (nonatomic, strong) TrackParams *trackParams;
@property (nonatomic, strong) NSArray *weappList;
@property (nonatomic, strong) NSArray *props;

@end

#pragma mark - KSItemInfoModel

@interface KSItemInfoModel : KSBaseModel

@property (nonatomic, copy) NSString *api;
@property (nonatomic, strong) Data *data;
@property (nonatomic, copy) NSString *v;
@property (nonatomic, strong) NSArray *ret;

@end
