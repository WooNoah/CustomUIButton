//
//  ViewController.m
//  StackviewButtonDemo
//
//  Created by Noah on 2019/11/26.
//  Copyright © 2019 fx. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>
#import "AButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIStackView *stackView = [[UIStackView alloc]init];
    stackView.backgroundColor = [UIColor lightGrayColor];
    stackView.axis = UILayoutConstraintAxisHorizontal;
    stackView.spacing = 10;
    stackView.alignment = UIStackViewAlignmentBottom;
    stackView.distribution = UIStackViewDistributionEqualCentering;
    [self.view addSubview:stackView];

    [stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.height.equalTo(@(150));
        make.width.equalTo(@250);
    }];
    
    for (int i = 0; i < 2; i++) {
        CGFloat color = (i/2) * 0.8;
        AButton *button = [AButton buttonWithType:(UIButtonTypeCustom)];
        button.backgroundColor = [UIColor colorWithRed:color green:color blue:color alpha:1];
        [button setTitle:[NSString stringWithFormat:@"title-%d",i] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"image%d",i]] forState:(UIControlStateNormal)];
        [stackView addArrangedSubview:button];
//        [self.view addSubview:button];
        
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(100, 100));
//            make.centerY.equalTo(self.view);
//            if (i == 0) make.left.equalTo(self.view).offset(20);
//            if (i == 1) make.right.equalTo(self.view).offset(-20);
        }];
        
//        [button layoutIfNeeded];
    }

}


@end
