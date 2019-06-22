//
//  TCGoodsInfoTableViewCell.m
//  TCMall
//
//  Created by Huazhixi on 2018/4/6.
//  Copyright © 2018年 HJB. All rights reserved.
//

#import "TCGoodsInfoTableViewCell.h"
#import "03 Constant.h"
#import "02 Macro.h"
#import <YYKit.h>

@interface TCGoodsInfoTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *goodsNameLbl;

@property (weak, nonatomic) IBOutlet UILabel *vipPrice;
@property (weak, nonatomic) IBOutlet UILabel *marketPriceLbl;
@property (weak, nonatomic) IBOutlet UILabel *marketPrice;

@property (weak, nonatomic) IBOutlet UILabel *goodsDec;

/// 满减券1
@property (weak, nonatomic) IBOutlet UIView *manjianquan1;
@property (weak, nonatomic) IBOutlet UILabel *manjianLabel1;

/// 满减券2
@property (weak, nonatomic) IBOutlet UIView *manjianquan2;
@property (weak, nonatomic) IBOutlet UILabel *manjianLabel2;



@end

@implementation TCGoodsInfoTableViewCell
- (void)awakeFromNib {
    [super awakeFromNib];
    
//    _goodsNameLbl.lineBreakMode = NSLineBreakByCharWrapping;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeCollectImgView:) name:@"ChangeCollectionImgView" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(selctSkuCation:) name:QC_Notification_ShopSkuSelect object:nil];
    // Initialization code
}

- (void)selctSkuCation:(NSNotification *)tion{
    
    QCShopDetailsSkuListModel *model = tion.userInfo[@"data"];
    
    _vipPrice.text =[NSString stringWithFormat:@"￥%@", [NSString stringWithFormat:@"%.2f", [model.goods_price floatValue]]];
}



- (void)changeCollectImgView:(NSNotification *)notification {
 

}


- (void)setModel:(QCShopDetailsModel *)model{
    _model = model;
    
    _vipPrice.text =[NSString stringWithFormat:@"￥%@", [NSString stringWithFormat:@"%.2f", [model.goods_price floatValue]]];
    
    NSString *marketPrice = [NSString stringWithFormat:@"￥%@", [NSString stringWithFormat:@"%.2f", [model.market_price floatValue]]];
    NSAttributedString *attrMarketPrice = [[NSAttributedString alloc] initWithString:marketPrice attributes:@{NSForegroundColorAttributeName : [UIColor lightGrayColor],NSFontAttributeName : [UIFont systemFontOfSize:10],NSStrikethroughStyleAttributeName :@(NSUnderlineStyleSingle),NSStrikethroughColorAttributeName : [UIColor lightGrayColor]}];
    _marketPrice.attributedText = attrMarketPrice;
    
    _goodsNameLbl.text = model.goods_title;
    _goodsDec.text = model.goods_desc;
    
    /// 设置优惠满减
    if (_model.promotion_list.count == 0) {
        _manjianquan1.hidden = YES;
        _manjianquan2.hidden = YES;
    }else if (_model.promotion_list.count ==1){
        _manjianquan1.hidden = NO;
        _manjianquan2.hidden = YES;
        QCShopDetailsPromotionListModel *proModel = model.promotion_list[0];
        _manjianLabel1.text = proModel.promotion_name;
        
    }else if (_model.promotion_list.count>1){
        _manjianquan1.hidden = NO;
        _manjianquan2.hidden = NO;
        
        QCShopDetailsPromotionListModel *proModel = model.promotion_list[0];
        _manjianLabel1.text = proModel.promotion_name;
        
        QCShopDetailsPromotionListModel *proModel2 = model.promotion_list[1];
        _manjianLabel2.text = proModel2.promotion_name;
    }
    
}

- (void)setGoodsModel:(TCGoodsModel *)goodsModel {
    _goodsModel = goodsModel;

   
    
    NSString *marketPrice = [NSString stringWithFormat:@"￥%@", [NSString stringWithFormat:@"%.2f", goodsModel.goodsInfo.market_price]];
    NSAttributedString *attrMarketPrice = [[NSAttributedString alloc] initWithString:marketPrice attributes:@{NSForegroundColorAttributeName : [UIColor lightGrayColor],NSFontAttributeName : [UIFont systemFontOfSize:10],NSStrikethroughStyleAttributeName :@(NSUnderlineStyleSingle),NSStrikethroughColorAttributeName : [UIColor lightGrayColor]}];
    _marketPrice.attributedText = attrMarketPrice;
    
    
    if (/*goodsModel.goodsInfo.store_id ==*/ 1) {//判断是否是自营商品，添加自营图标

        NSString *goodsName = goodsModel.goodsInfo.goods_name;
        NSMutableAttributedString *goodsNameAttributeStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@" %@", goodsName]];
        goodsNameAttributeStr.font = [UIFont boldSystemFontOfSize:16];
        goodsNameAttributeStr.color = MAIN_TEXT_COLOR;

        NSTextAttachment *attach = [[NSTextAttachment alloc] init];
        attach.image = [UIImage imageNamed:@"deta_04"];
        attach.bounds = CGRectMake(0, -2, 33, 15);
        NSAttributedString *attributeStr2 = [NSAttributedString attributedStringWithAttachment:attach];
        [goodsNameAttributeStr insertAttributedString:attributeStr2 atIndex:0];
        _goodsNameLbl.attributedText = goodsNameAttributeStr;
    } else {
        _goodsNameLbl.text = goodsModel.goodsInfo.goods_name;
    }
    
    if (goodsModel.goodsInfo.store_id == 72) {// 天元商品
        NSMutableAttributedString *goodsNameAttributeStr = [[NSMutableAttributedString alloc] initWithString:@" 天元"];
        goodsNameAttributeStr.font = [UIFont boldSystemFontOfSize:14];
        goodsNameAttributeStr.color = NORMAL_TEXT_COLOR;
        NSTextAttachment *attach = [[NSTextAttachment alloc] init];
        attach.image = [UIImage imageNamed:@"tianyuan_color"];
        attach.bounds = CGRectMake(0, -3, 15, 15);
        NSAttributedString *attributeStr2 = [NSAttributedString attributedStringWithAttachment:attach];
        [goodsNameAttributeStr insertAttributedString:attributeStr2 atIndex:0];
        
        //天元专区不显示市场价
        _marketPriceLbl.text = @"";
        _marketPrice.text = @"";
       
        
        _vipPrice.text = [NSString stringWithFormat:@"%.2f", goodsModel.goodsInfo.price];
    } else {
        _vipPrice.text = [NSString stringWithFormat:@"￥%.2f", goodsModel.goodsInfo.price];
    }
}
- (IBAction)addressChooseBtnClick {
    if ([_delegate respondsToSelector:@selector(goodsInfoCellChooseAddressWithIndex:)]) {
        [_delegate goodsInfoCellChooseAddressWithIndex:_indexPath];
    }
}
- (IBAction)collectBtn:(UIButton *)sender {
    if ([_delegate respondsToSelector:@selector(goodsInfoTableViewCellCollect:)]) {
        [_delegate goodsInfoTableViewCellCollect:sender];
    }
}

@end
