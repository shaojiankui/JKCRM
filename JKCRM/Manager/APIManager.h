//
//  APIManager.h
//  JKCRM
//
//  Created by Jakey on 14/12/1.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIManager : NSObject
+ (instancetype)sharedManager;
- (void)post:(NSDictionary *)param
         uri:(NSString*)uri
    andBlock:(void (^)(NSDictionary *collection, NSError *error))block;
@end
