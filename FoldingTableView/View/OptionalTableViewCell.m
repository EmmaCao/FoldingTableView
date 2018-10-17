//
//  OptionalTableViewCell.m
//  FoldingTableView
//
//  Created by Emma on 2018/10/16.
//  Copyright © 2018年 EmmaCao. All rights reserved.
//

#import "OptionalTableViewCell.h"

@interface OptionalTableViewCell()

@property (weak, nonatomic) IBOutlet UIButton *btnIsChecked;

@end

@implementation OptionalTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    if (selected) {
        [self.btnIsChecked setImage:[UIImage imageNamed:@"btn_check"] forState:UIControlStateNormal];
    }else{
        [self.btnIsChecked setImage:[UIImage imageNamed:@"btn_uncheck"] forState:UIControlStateNormal];
    }
}

@end
