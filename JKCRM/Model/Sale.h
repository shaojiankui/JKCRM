//
//  Sale.h
//  JKCRM
//
//  Created by Jakey on 14/12/1.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "BaseModel.h"
@interface Sale : BaseModel
@property (strong,nonatomic) NSString *saleID;
@property (strong,nonatomic) NSString *saleName;
@property (strong,nonatomic) NSString *saleMobile;
@property (strong,nonatomic) NSString *saleStatusCode;
@property (strong,nonatomic) NSString *saleStatus;
@property (retain,nonatomic) NSNumber *saleTime;
@property (strong,nonatomic) NSString *saleComment;
@property (strong,nonatomic) NSString *custID;
@property (strong,nonatomic) NSString *custName;
@property (strong,nonatomic) NSString *custMobile;
@property (strong,nonatomic) NSString *custOtherPhone;
@property (strong,nonatomic) NSString *homePhone;
@property (retain,nonatomic) NSNumber *createdTime;
@property (strong,nonatomic) NSString *goodID;
@property (strong,nonatomic) NSString *goodModel;
@property (strong,nonatomic) NSString *goodBrand;
@property (strong,nonatomic) NSString *goodName;

+(void)getSaleList:(NSDictionary*)param
          andBlock:(void (^)(NSDictionary *collection, NSError *error))block;
@end
