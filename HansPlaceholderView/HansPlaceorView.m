//
//  HansPlaceorView.m
//  PeopleTv
//
//  Created by 金阳 on 16/6/24.
//  Copyright © 2016年 Hans. All rights reserved.
//

#import "HansPlaceorView.h"
#import "UIView+HansExtension.h"
@interface HansPlaceorView()

@property(nonatomic,strong)UILabel *placehoderlabel;

@end


@implementation HansPlaceorView


-(UILabel *)placehoderlabel
{
    if (!_placehoderlabel) {
        //添加label 占位
        UILabel *placehoderlabel = [[UILabel alloc] init];
        placehoderlabel.numberOfLines  =0;
        placehoderlabel.x = 4;
        placehoderlabel.y =7;
        [self addSubview:placehoderlabel];
        _placehoderlabel = placehoderlabel;
    }
    return _placehoderlabel;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //垂直方向弹簧效果
        self.alwaysBounceVertical = YES;
        
        //默认字体
        
        self.font = [UIFont systemFontOfSize:13];
        
        
        //默认颜色
        self.placeholderColor = [UIColor grayColor];
        
        //监听文字改变  通知
        [HansCenter addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:nil];
        
        
       
        
    }
    return self;
}
- (void)textDidChange
{
     // 只要有文字, 就隐藏占位文字label
    self.placehoderlabel.hidden = self.hasText;
}
/**
 * 更新占位文字的尺寸
 */
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.placehoderlabel.width  =self.width - 2*self.placehoderlabel.x;
    [self.placehoderlabel sizeToFit];
    
}


-(void)setPlaceholderColor:(UIColor *)placeholderColor
{
    _placeholderColor  = placeholderColor;
    
    self.placehoderlabel.textColor  =placeholderColor;
    [self setNeedsLayout];
}

- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder  =[placeholder copy];
    
    self.placehoderlabel.text  = placeholder;
    
    [self setNeedsLayout];
   
    
    
}
- (void)setPlaceholderFont:(UIFont *)placeholderFont
{
    [super setFont:placeholderFont];
    self.placehoderlabel.font  =placeholderFont;
    [self setNeedsLayout];
}
-(void)setText:(NSString *)text
{
    [super setText:text];
    [self textDidChange];
    
}
-(void)setAttributedText:(NSAttributedString *)attributedText
{
    [super setAttributedText:attributedText];
    [self textDidChange];

}
- (void)dealloc
{
    [HansCenter removeObserver:self];

}

@end
