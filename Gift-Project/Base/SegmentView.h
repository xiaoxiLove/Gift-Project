//
//  SegmentView.h
//  CustomSegmentControl
//
//  Created by CORYIL on 16/3/28.
//  Copyright © 2016年 徐锐. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ButtonSelectBlock)(NSInteger selectedIndex);

@interface SegmentView : UIView

@property (nonatomic,readonly,strong) NSArray *titles;

@property (nonatomic,strong)UIImage *selectedImage;

@property (nonatomic,assign)NSInteger selectedIndex;

@property (nonatomic,copy,readonly) ButtonSelectBlock selectBlock;

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles;

/**
 *  点击分段控件按钮调用的方法
 */
-(void)segmentViewButtonClick:(ButtonSelectBlock)selectBlock;

@end
