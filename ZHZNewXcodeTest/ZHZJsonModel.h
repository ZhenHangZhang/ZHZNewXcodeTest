//
//  ZHZJsonModel.h
//  ZHZNewXcodeTest
//
//  Created by zhanghangzhen on 16/9/22.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import <JSONModel/JSONModel.h>


@protocol ProductModel <NSObject>



@end
@interface ProductModel : JSONModel

@property(nonatomic,copy)NSString *name;


@end


@interface ZHZJsonModel : JSONModel

@property (assign, nonatomic) int id;

//可选属性Optional，可以为null
@property (strong, nonatomic) NSString<Optional>* name;
@property (assign, nonatomic) float price;
//忽略属性Ignore
@property(nonatomic,copy)NSString<Ignore> *age;
@property (strong, nonatomic) NSArray<ProductModel>* products;

@end
