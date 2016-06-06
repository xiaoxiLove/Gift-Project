//
//  HotModel.h
//  Gift-Project
//
//  Created by Honey on 16/6/4.
//  Copyright © 2016年 tingting. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HotModel : NSObject

@property(nonatomic,copy)NSString *giftName;

@property(nonatomic,strong)NSNumber *giftPrice;

@property(nonatomic,copy)NSString *giftDetail;

@property(nonatomic,copy)NSString *imageurl;

@property(nonatomic,strong)NSArray *array;
@end
