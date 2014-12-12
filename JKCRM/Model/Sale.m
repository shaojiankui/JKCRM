//
//  Sale.m
//  JKCRM
//
//  Created by Jakey on 14/12/1.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "Sale.h"

@implementation Sale
+(void)getSaleList:(NSDictionary*)param
          andBlock:(void (^)(NSDictionary *collection, NSError *error))block{

        [[APIManager sharedManager] post:param uri:@"saleList.do" andBlock:^(NSDictionary *collection, NSError *error) {
            block(collection,error);
        }];
}
@end
