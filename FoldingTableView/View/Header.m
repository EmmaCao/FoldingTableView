//
//  Header.m
//  FoldingTableView
//
//  Created by Emma on 2018/10/16.
//  Copyright © 2018年 EmmaCao. All rights reserved.
//

#import "Header.h"

@interface Header()

@property (nonatomic) UIImageView *imgvDirection;
@property (nonatomic) UILabel *lblDepText;
@property (nonatomic) UIButton *btnCheck;
@property (nonatomic) UIButton *btn;

@end

@implementation Header

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if ([super initWithReuseIdentifier:reuseIdentifier]) {
        [self setupView];
    }
    return self;
}

-(void)setupView
{
    self.btn = [UIButton new];
    self.btn.backgroundColor = [UIColor clearColor];
    [self.btn addTarget:self action:@selector(clickHeader:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.btn];
    [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-60);
        make.top.mas_equalTo(self.contentView);
        make.bottom.mas_equalTo(self.contentView);
    }];
    
    self.imgvDirection = [UIImageView new];
    self.imgvDirection.image = [UIImage imageNamed:@"btn_down"];
    [self.contentView addSubview:self.imgvDirection];
    [self.imgvDirection mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.left.mas_equalTo(self.contentView.mas_left).offset(10);
        make.height.mas_equalTo(7);
        make.width.mas_equalTo(8);
    }];
    
    self.lblDepText = [UILabel new];
    [self.contentView addSubview:self.lblDepText];
    [self.lblDepText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.left.mas_equalTo(self.imgvDirection.mas_left).offset(10);
    }];
    
    self.btnCheck = [UIButton new];
    [self.btnCheck addTarget:self action:@selector(clickBtnCheck:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.btnCheck];
    [self.btnCheck mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-14);
    }];
}

-(void)clickBtnCheck:(UIButton *)btn
{
    self.sectionModel.isSelected = !self.sectionModel.isSelected;
    
    if (self.sectionModel.isSelected) {
        [self.btnCheck setImage:[UIImage imageNamed:@"btn_check"] forState:UIControlStateNormal];
    }else{
        [self.btnCheck setImage:[UIImage imageNamed:@"btn_uncheck"] forState:UIControlStateNormal];
    }
    
    if (self.clickCheckBtn) {
        self.clickCheckBtn(self.sectionModel.isSelected);
    }
    
    self.sectionModel.isExpanded = YES;
    if (self.clickBackHeaderView) {
        self.clickBackHeaderView(self.sectionModel.isExpanded);
    }
}

-(void)clickHeader:(UIButton *)btn
{
    self.sectionModel.isExpanded = !self.sectionModel.isExpanded;
    
    [UIView animateWithDuration:0.25 animations:^{
        
        if (self.sectionModel.isExpanded) {
            self.imgvDirection.image = [UIImage imageNamed:@"btn_down"];
        }else{
            self.imgvDirection.image = [UIImage imageNamed:@"btn_right"];
        }
    }];
    
    if (self.clickBackHeaderView) {
        self.clickBackHeaderView(self.sectionModel.isExpanded);
    }
}

-(void)setSectionModel:(SectionModel *)sectionModel
{
    _sectionModel = sectionModel;
    
    self.lblDepText.text = sectionModel.sectionTitle;
    
    if (self.sectionModel.isExpanded) {
        self.imgvDirection.image = [UIImage imageNamed:@"btn_down"];
    }else{
        self.imgvDirection.image = [UIImage imageNamed:@"btn_right"];
    }
    
    if (self.sectionModel.isSelected) {
        [self.btnCheck setImage:[UIImage imageNamed:@"btn_check"] forState:UIControlStateNormal];
    }else{
        [self.btnCheck setImage:[UIImage imageNamed:@"btn_uncheck"] forState:UIControlStateNormal];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
