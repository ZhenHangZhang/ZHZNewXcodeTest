//
//  ZHZJsonModel.m
//  ZHZNewXcodeTest
//
//  Created by zhanghangzhen on 16/9/22.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import "ZHZJsonModel.h"

@implementation ZHZJsonModel

//实现这个方法是多级映射或者修改映射KEY

+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                       @"order_id": @"id",
                                                       @"order_details.name": @"productName",
                                                       @"order_details.price.usd": @"price"
                                                       }];
}

@end
