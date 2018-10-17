//
//  CellModel.m
//  FoldingTableView
//
//  Created by Emma on 2018/10/16.
//  Copyright © 2018年 EmmaCao. All rights reserved.
//

#import "CellModel.h"

@implementation CellModel

+(instancetype)cellModelWithTitle:(NSString *)title selected:(BOOL)isSelected
{
    CellModel *model = [[CellModel alloc] init];
    model.title = title;
    model.selected = isSelected;
    
    return model;
}

@end
