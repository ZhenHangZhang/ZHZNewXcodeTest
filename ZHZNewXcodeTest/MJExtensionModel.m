//
//  MJExtensionModel.m
//  ZHZNewXcodeTest
//
//  Created by zhanghangzhen on 16/9/22.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import "MJExtensionModel.h"

@implementation MJExtensionModel

/* 设置模型属性名和字典key之间的映射关系 */
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             //字段不一样
             @"ID" : @"id",
             @"desc" : @"desciption",
             //模型的下一级属性
             @"oldName" : @"name.oldName",
             @"nowName" : @"name.newName",
             //模型的数组的某个原素的属性
             @"nameChangedTime" : @"name.info[1].nameChangedTime",
             //模型的下一级属性

             @"bag" : @"other.bag"
             };
}

@end
