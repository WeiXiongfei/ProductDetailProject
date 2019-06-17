/*
 宝贝详情跟视图
 */
#import "XFBaseViewController.h"
#import "TCGoodsModel.h"

@interface TCBabyDeailtyRootVC : XFBaseViewController
/**   */
@property (nonatomic, copy) NSString *goodsID;
/**   */
@property (nonatomic, copy) NSString *goods_img;
/**     */
@property (strong, nonatomic) TCGoodsModel *goodsModel;
@end
