//
//  TCBabyDeailtyCell.m
//  TCMall
//
//  Created by 栗子 on 2018/1/29.
//  Copyright © 2018年 HJB. All rights reserved.
//

#import "TCBabyDeailtyCell.h"
#import "QCShopDetailsModel.h"
@interface TCBabyDeailtyCell ()

@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *daodaLabel;
@property (weak, nonatomic) IBOutlet UILabel *运费;

@end

@implementation TCBabyDeailtyCell

- (void)awakeFromNib {
    [super awakeFromNib];
  
    // Initialization code
}


/// 点击规格
- (IBAction)chooseGuigeBtnClick {
    if (_babyDealtyCellGuiGeBlock) {
        _babyDealtyCellGuiGeBlock();
    }
}

/// 点击配送
- (IBAction)goodsParamBtnClick {
    if (_babyDealtyCellGoodsParamBlock) {
        _babyDealtyCellGoodsParamBlock();
    }
}

/// 点击运费
- (IBAction)youhuijuanBtnClick {
    if (_babyDealtyCellYouhuiBlock) {
        _babyDealtyCellYouhuiBlock();
    }
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
