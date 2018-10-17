//
//  SectionModel.m
//  approvalsystemformember
//
//  Created by Emma on 2018/9/25.
//  Copyright © 2018年 Emma. All rights reserved.
//

#import "SectionModel.h"

@implementation SectionModel

+(instancetype)sectionModelWithTitle:(NSString *)title isExpanded:(BOOL)isExpanded isSeleted:(BOOL)isSelected cellModels:(NSArray *)cellModels
{
    SectionModel *sectionModel = [[SectionModel alloc] init];
    sectionModel.sectionTitle = title;
    sectionModel.isExpanded = isExpanded;
    sectionModel.isSelected = isSelected;
    sectionModel.cellModels = cellModels;
    
    return sectionModel;
}

+(instancetype)sectionModelWithTitle:(NSString *)title subTitle:(NSString *)subTitle isExpanded:(BOOL)isExpanded cellModels:(NSArray *)cellModels
{
    SectionModel *sectionModel = [[SectionModel alloc] init];
    sectionModel.sectionTitle = title;
    sectionModel.subTitle = subTitle;
    sectionModel.isExpanded = isExpanded;
    sectionModel.cellModels = cellModels;
    
    return sectionModel;
}

+(instancetype)sectionModelWithTitle:(NSString *)title subTitle:(NSString *)subTitle isExpanded:(BOOL)isExpanded isSeleted:(BOOL)isSelected cellModels:(NSArray *)cellModels
{
    SectionModel *sectionModel = [SectionModel sectionModelWithTitle:title subTitle:subTitle isExpanded:isExpanded cellModels:cellModels];
    sectionModel.isSelected = isSelected;
    
    return sectionModel;
}

@end
