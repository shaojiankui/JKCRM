//
//  NSString+NSArray.m
//  JKCRM
//
//  Created by Jakey on 14/11/25.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "NSString+NSArray.h"

@implementation NSString (NSArray)
-(NSArray *) JsonToArray{
    NSError *errorJson;
    NSArray *ret = [NSJSONSerialization JSONObjectWithData:[self dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&errorJson];
    return ret;
}
@end
