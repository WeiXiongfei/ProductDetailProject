//
//  TCBabyDeailtyComentVC.h
//  TCMall
//
//  Created by 栗子 on 2018/1/29.
//  Copyright © 2018年 HJB. All rights reserved.
//

#import "XFBaseViewController.h"
//#import "BaseNatigationViewController.h"
#import "02 Macro.h"
#import "03 Constant.h"
#import "LLSegmentBar.h"
#import "LLSegmentBarVC.h"
#import "TCGoodsModel.h"

@interface TCBabyDeailtyComentVC : XFBaseViewController

@property (nonatomic,strong)LLSegmentBar *segmentBar;

//@property (nonatomic,strong)BaseNatigationViewController *baseNavController;

@property (nonatomic,strong)UIViewController *fatherVC;
/**   */
@property (nonatomic, copy) NSString *goodsID;
/**     */
@property (strong, nonatomic) TCGoodsModel *goodsModel;
@end
