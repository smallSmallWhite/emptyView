//
//  EmptyView.m
//  ownerCarSide
//
//  Created by mac on 2017/6/10.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "EmptyView.h"
#import "UIView+Gesture.h"
#import "XSWGlobalConfig.pch"


@interface EmptyView()

//占位图片
@property (nonatomic,strong) UIImageView *placeImageView;
//加载失败文字
@property (nonatomic,strong) UILabel *loadFailedLabel;
//重新加载
@property (nonatomic,strong) UILabel *retryLoadlabel;


@end

@implementation EmptyView

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self settingView];
    }
    return self;
}

#pragma mark ==================初始化设置==================
- (void)settingView {
    
    //占位图片
    _placeImageView = [[UIImageView alloc ]init];
    _placeImageView.image = [UIImage imageNamed:@"无网络"];
    [self addSubview:_placeImageView];
    
    //加载失败的文字
    _loadFailedLabel = [[UILabel alloc] init];
    _loadFailedLabel.text = @"网络已断开，请检查网络";
    [UILabel setLabelTextColor:UIColorFromRGBValue(0x959595) AndFontSize:[self autoScaleW:16] WithLabel:_loadFailedLabel];
    _loadFailedLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_loadFailedLabel];
    
    //重新加载文字
    _retryLoadlabel = [[UILabel alloc] init];
    _retryLoadlabel.text = @"点击屏幕重新加载";
    [UILabel setLabelTextColor:UIColorFromRGBValue(0x959595) AndFontSize:[self autoScaleW:14] WithLabel:_retryLoadlabel];
    _retryLoadlabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_retryLoadlabel];
    
    //布局
    [self layoutView];
    
    //添加手势
    [UIView addTapToView:self withTarget:self withTag:2000 withAction:@selector(clickACtion:)];
    
    
}
#pragma mark ==================view布局==================
- (void)layoutView {
    
    [_placeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerY.equalTo(self).offset(-80);
        make.width.equalTo([self autoScaleW:393/2]);
        make.height.equalTo([self autoScaleH:258/2]);
        make.centerX.equalTo(self).offset(0);
    }];
    
    [_loadFailedLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(_placeImageView.bottom).offset(0);
        make.width.equalTo(self.width);
        make.height.equalTo(21);
        make.centerX.equalTo(self).offset(0);
        
    }];
    
//    [_retryLoadlabel mas_makeConstraints:^(MASConstraintMaker *make) {
//
//        make.top.equalTo(_loadFailedLabel.bottom).offset(10);
//        make.width.equalTo(self.width);
//        make.height.equalTo(21);
//        make.centerX.equalTo(self).offset(0);
//    }];
}
#pragma mark ==================手势回调==================
- (void)clickACtion:(UITapGestureRecognizer *)sender {
    
    if (self.delegates && [self.delegates respondsToSelector:@selector(clickEmptyViewWithAction:)]) {
        
        [self.delegates clickEmptyViewWithAction:sender.view];
    }
    
}
@end
