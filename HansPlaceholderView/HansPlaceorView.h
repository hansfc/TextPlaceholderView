//
//  HansPlaceorView.h
//  PeopleTv
//
//  Created by 金阳 on 16/6/24.
//  Copyright © 2016年 Hans. All rights reserved.
//  拥有占位功能的 UITextView

#import <UIKit/UIKit.h>

@interface HansPlaceorView : UITextView

/**
 *  占位文字
 */

@property(nonatomic,copy)NSString *placeholder;
/**
 *  占位文字颜色
 */

@property(nonatomic,strong)UIColor *placeholderColor;

@end
