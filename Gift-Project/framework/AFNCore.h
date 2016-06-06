//
//  AFNCore.h
//  Gift-Project
//
//  Created by mac on 16/6/6.
//  Copyright © 2016年 tingting. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^MyBlock)(id result);

@interface AFNCore : NSObject

+ (void)registerByEmail:(NSString *)email byPassword:(NSString *)password byMyBlock:(MyBlock)block;

+ (void)loginByEmail:(NSString *)email byPassword:(NSString *)password byMyBlock:(MyBlock)block;

+ (NSArray *)queryUserInformationByEmail:(NSString *)email;

@end
