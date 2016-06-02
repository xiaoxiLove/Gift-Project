//
//  BaseModel.h
//  Gift-Project
//
//  Created by mac on 16/6/2.
//  Copyright © 2016年 tingting. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject

//key:原来字典的key object:新的属性名
@property (nonatomic,strong)NSDictionary *mapDic;

- (instancetype)initWithDic:(NSDictionary *)dictionary;

- (void)setAttributes:(NSDictionary *)dictionary;

@end
