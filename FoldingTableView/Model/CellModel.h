//
//  CellModel.h
//  FoldingTableView
//
//  Created by Emma on 2018/10/16.
//  Copyright © 2018年 EmmaCao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CellModel : NSObject

@property (nonatomic, getter=isSelected) BOOL selected;
@property (nonatomic, copy) NSString *title;

+(instancetype)cellModelWithTitle:(NSString *)title selected:(BOOL)isSelected;

@end
