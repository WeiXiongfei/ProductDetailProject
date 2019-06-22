/*
 宝贝详情底部工具条
 */

#import "TCBabyDeailtyBottomToolsView.h"
#import "EasyShowView.h"
#import "WZLBadgeImport.h"


//#import "TCShopCartViewController.h"


@interface TCBabyDeailtyBottomToolsView()

/// 购物车图片
@property (weak, nonatomic) IBOutlet UIImageView *cartImgView;

/// 购买返利label
@property (weak, nonatomic) IBOutlet UILabel *goumaiLabel;

/// 推广赚钱label
@property (weak, nonatomic) IBOutlet UILabel *tuiguanLabel;

/// 购买labelTop
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *goumaiTopCos;

/// 推广宽度Cos
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tuiguangWCos;
@property (weak, nonatomic) IBOutlet UIView *tuiSupview;





@end

@implementation TCBabyDeailtyBottomToolsView

-(void)awakeFromNib
{
    [super awakeFromNib];
    
//    // 待添加功能
    [_cartImgView showBadgeWithStyle:WBadgeStyleNumber value:10 animationType:WBadgeAnimTypeNone];
    
    [self setUI];
}

- (void)setUI{
    
    if (![QCMyModel shareInstance].is_vip) {
        self.goumaiLabel.hidden = YES;
        self.goumaiTopCos.constant = 17.f;
        self.tuiguangWCos.constant= -SCREEN_WIDTH/32*22*self.tuiguangWCos.multiplier;
        self.tuiSupview.hidden = YES;
    }
}

/// 加入购物车
- (IBAction)AddGoods:(UIButton *)sender {
   
    if (self.cartAddBackAction) {
        self.cartAddBackAction();
    }
}
//3.进入购物车页面
- (IBAction)bottomAction:(UIButton *)sender {
    if (_backAction) {
        _backAction(0);
    }
}

// 进入首页
- (IBAction)pushHomeCliick:(id)sender {
    if (_backAction) {
        _backAction(1);
    }
}

///购买
- (IBAction)goumaiClick:(id)sender {
}


/// 推广
- (IBAction)tuiguangClick:(id)sender {
}



- (IBAction)buyGoods:(UIButton *)sender {
    if (self.buyGoods) {
        self.buyGoods();
    }
}

@end
