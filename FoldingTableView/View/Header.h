//
//  Header.h
//  FoldingTableView
//
//  Created by Emma on 2018/10/16.
//  Copyright © 2018年 EmmaCao. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SectionModel.h"

typedef void (^ClickBackHeaderView)(BOOL);
typedef void (^ClickCheckBtn)(BOOL);

@interface Header : UITableViewHeaderFooterView

@property (nonatomic, copy) ClickBackHeaderView clickBackHeaderView;
@property (nonatomic, copy) ClickCheckBtn clickCheckBtn;

@property (nonatomic, strong) SectionModel *sectionModel;

@end
