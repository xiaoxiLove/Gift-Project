//
//  BaseModel.m
//  Gift-Project
//
//  Created by mac on 16/6/2.
//  Copyright © 2016年 tingting. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

- (instancetype)initWithDic:(NSDictionary *)dictionary{
    
    if (self = [super init]) {
        
        [self setAttributes:dictionary];
        
    }
    return self;
    
}

- (void)setAttributes:(NSDictionary *)dictionary{
    
    //1.获取字典的所有key
    NSArray *allkeys = [dictionary allKeys];
    
    //2.遍历所有的key
    
    for (NSString *key in allkeys) {
        
        //3.
        SEL setSelector = [self selFromAttributeName:key];
        
        //4.判断本次构建的set方法 是否被本类对象响应 (如果yes说明存在这个属性)
        if ([self respondsToSelector:setSelector]) {
            
            //5.获取key对应的字典中的对象
            id object = [dictionary objectForKey:key];
            
            //6.将对象通过set方法保存到属性里 setImg:
            
            [self performSelector:setSelector withObject:object];
            
        }
        
        /*————————— 属性名和字典key不相同的情况 ————————*/
        
        for (NSString *mapKey in [self.mapDic allKeys]) {
            
            //从mapDic中获取对象 -> 新的属性名字符串
            NSString *attributeName = [self.mapDic objectForKey:mapKey];
            
            //通过新的属性名 构建set方法
            SEL setMehod = [self selFromAttributeName:attributeName];
            
            //获取数据字典中的对象
            id object = [dictionary objectForKey:mapKey];
            
            if ([self respondsToSelector:setMehod]) {
                
                //通过set方法 保存字典的值到属性中
                [self performSelector:setMehod withObject:object];
                
            }
            
        }
        
        
    }
    
}

- (SEL)selFromAttributeName:(NSString *)attributeName{
    
    //获取key的首字母并变成大写  :  img -> 获取i -> 变成I
    NSString *firstChar = [[attributeName substringToIndex:1]uppercaseString];
    
    //获取key的首字母意外的字符串 保持不变 : mg
    NSString *otherChars = [attributeName substringFromIndex:1];
    
    //将大写的首字母和不变其他字符串拼接成set方法 : setImg:
    NSString *setMethod = [NSString stringWithFormat:@"set%@%@:",firstChar,otherChars];
    
    //构建SEL类型的set方法
    SEL setSelector = NSSelectorFromString(setMethod);
    
    return setSelector;
    
}


@end
