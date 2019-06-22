

#import <UIKit/UIKit.h>


typedef void(^addGoodsCartCallBack)();

typedef void(^buyGoodsCallBack)();

typedef void(^callBackBottomAction)(NSInteger tag);

@interface TCBabyDeailtyBottomToolsView : UIView

@property (nonatomic,copy)addGoodsCartCallBack cartAddBackAction;
@property (nonatomic,copy)buyGoodsCallBack buyGoods;
@property (nonatomic,copy)callBackBottomAction backAction;

@property (weak, nonatomic) IBOutlet UIView *storeBtnView;
@property (weak, nonatomic) IBOutlet UIView *shoppingCartBtnView;
@property (weak, nonatomic) IBOutlet UIView *threeBtnView;

@property (nonatomic,copy) NSString *shopCount;

/**     */
@property (nonatomic, assign) NSInteger store_id;


/// 加入购物车view
@property (weak, nonatomic) IBOutlet UIView *addGouView;

/// 进入购物车View
@property (weak, nonatomic) IBOutlet UIView *pushGouView;

@end
