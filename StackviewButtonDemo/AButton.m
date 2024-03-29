//
//  AButton.m
//  StackviewButtonDemo
//
//  Created by Noah on 2019/11/26.
//  Copyright © 2019 fx. All rights reserved.
//

#import "AButton.h"
#import <Masonry.h>

#define toggleSwitch 1

@implementation AButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
#if toggleSwitch
#else
        self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
#endif
    }
    return self;
}
/*
 有三种方式可以自定义UIButton内部的imageView、titleLabel的位置
 1. 使用系统提供的方法：
    setImageEdgeInsets
    setTitleEdgeInsets
 
 2. 在layoutSubviews方法中。手动修改imageView、titleLabel控件的frame
    如下 part ①中的代码
 
 3. 想要使用Masonry自己处理约束的话，那就得先设置为不让系统自动处理约束
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    然后使用masonry添加约束即可
    
    但是遇到一个问题此处会有一个问题：
    imageView默认是居中的
    如果只添加设置约束方法，但是不添加任何约束
     [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
     }];
    此时则是图片原始大小，然后居中显示
 
    但是想要通过
        make.size.mas_equalTo(self.imageView.image.size);
    调整约束的话，是无效的。
    但是可以调整上下左右的位置来调整达到类似的效果
    
 */
- (void)layoutSubviews {
    [super layoutSubviews];
    
#if toggleSwitch
    //Part ①
    
    /*
     这里有一种情况，如果图片过大，使用part ①这种方法修改，会造成titleLabel宽度为0
     使用sizeToFit方法才能正常显示
     */
//    [self.imageView sizeToFit];
//    [self.titleLabel sizeToFit];
    
    self.imageView.frame = CGRectMake((self.frame.size.width - self.imageView.frame.size.width)/2, 5, self.imageView.image.size.width, self.imageView.image.size.height);
    self.titleLabel.frame = CGRectMake((self.frame.size.width - self.titleLabel.frame.size.width)/2, self.frame.size.height - 5 - self.titleLabel.frame.size.height, self.titleLabel.frame.size.width, self.titleLabel.frame.size.height);
    
    
#else
    
    //Part ②
//    [self layoutIfNeeded];
//    [self.imageView sizeToFit];
//    [self.titleLabel sizeToFit];
    
    
    [self.imageView removeConstraints:self.imageView.constraints];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        //1 这是系统给的四个约束，想要调整，需要给原有的约束添加新的值
        make.centerX.equalTo(self);
        make.centerY.equalTo(self).offset(-10);
        make.width.equalTo(@(self.imageView.image.size.width));
        make.height.equalTo(@(self.imageView.image.size.height));
        
        //2
//        make.top.equalTo(self).offset(10);
//        make.bottom.equalTo(self).offset(-60);
//        make.left.equalTo(self).offset(20);
//        make.right.equalTo(self).offset(-50);
                
//          //这里通过设置size是无效的，只能设置width/height
//        make.size.mas_equalTo(self.imageView.image.size);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(self.mas_bottom).offset(-10);
    }];
#endif
}

@end
