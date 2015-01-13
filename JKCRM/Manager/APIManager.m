//
//  APIManager.m
//  JKCRM
//
//  Created by Jakey on 14/12/1.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "APIManager.h"
#import "NSDictionary+JsonString.h"
#import "NSString+DictionaryValue.h"
@implementation APIManager
+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    static APIManager *_sharedManager = nil;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[APIManager alloc] init];
       
    });
    return _sharedManager;
}

- (void)post:(NSDictionary *)param
         uri:(NSString*)uri
    andBlock:(void (^)(NSDictionary *collection, NSError *error))block {
    
    NSString *post = [NSString string];
    if (param!=nil) {
        post= [param jsonString];
    }
    
    NSDictionary *dic = [[self findLocalJSON:uri] dictionaryValue];
    dispatch_async(dispatch_get_main_queue(), ^(void){
        block(dic,nil);
    });
}

- (NSString*)findLocalJSON:(NSString*)jsonDo{
    NSMutableString *jsonDoString = [NSMutableString stringWithString:jsonDo];
    NSRange range = {0, [jsonDoString length]};
    
    [jsonDoString replaceOccurrencesOfString:@".do" withString:@"" options:NSBackwardsSearch range:range];
    
    NSString *JsonPath = [[NSBundle mainBundle] pathForResource:jsonDoString ofType:@"json"];
    
    NSString *jsonString=[NSString stringWithContentsOfFile:JsonPath encoding:NSUTF8StringEncoding error:nil];
    
    return jsonString;
}
@end
