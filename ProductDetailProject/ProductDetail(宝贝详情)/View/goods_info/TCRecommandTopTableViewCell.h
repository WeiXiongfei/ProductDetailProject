//
//  TCRecommandTopTableViewCell.h
//  TCMall
//
//  Created by Huazhixi on 2018/3/7.
//  Copyright © 2018年 HJB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TCRecommandTopTableViewCell : UITableViewCell

@property (nonatomic,strong)BaseModel *model;

@property (nonatomic,copy)NSArray *recommentArr;
@property (nonatomic,copy)NSArray *catCommentArr;

@end
