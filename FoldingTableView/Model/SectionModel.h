//
//  SectionModel.h
//  approvalsystemformember
//
//  Created by Emma on 2018/9/25.
//  Copyright © 2018年 Emma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SectionModel : NSObject

@property (nonatomic, copy) NSString *sectionTitle;
@property (nonatomic, copy) NSString *subTitle;
@property (nonatomic) BOOL isExpanded;
@property (nonatomic) BOOL isSelected;
@property (nonatomic, copy) NSArray *cellModels;

/** title,isExpand,isSelected,cellModels */
+(instancetype)sectionModelWithTitle:(NSString *)title isExpanded:(BOOL)isExpanded isSeleted:(BOOL)isSelected cellModels:(NSArray *)cellModels;

/** title,subTitle,isExpand,cellModels */
+(instancetype)sectionModelWithTitle:(NSString *)title subTitle:(NSString *)subTitle isExpanded:(BOOL)isExpanded cellModels:(NSArray *)cellModels;

/** title,subTitle,isExpand,isSeleted,cellModels */
+(instancetype)sectionModelWithTitle:(NSString *)title subTitle:(NSString *)subTitle isExpanded:(BOOL)isExpanded isSeleted:(BOOL)isSelected cellModels:(NSArray *)cellModels;

@end
