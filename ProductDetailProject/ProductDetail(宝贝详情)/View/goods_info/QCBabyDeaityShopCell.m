//
//  QCBabyDeaityShopCell.m
//  QinCaoShop
//
//  Created by 张健 on 2019/6/17.
//  Copyright © 2019年 qincao. All rights reserved.
//

#import "QCBabyDeaityShopCell.h"
#import "QCShopDetailsModel.h"

@interface QCBabyDeaityShopCell ()
@property (weak, nonatomic) IBOutlet UIImageView *cell_image;

@property (weak, nonatomic) IBOutlet UILabel *cell_name;
@property (weak, nonatomic) IBOutlet UILabel *cell_price;
@property (weak, nonatomic) IBOutlet UILabel *cell_oldPrice;

@end

@implementation QCBabyDeaityShopCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setModel:(QCShopDetailsRecommentListModel *)model{
    
    _model = model;
    
    [self.cell_image sd_setImageWithURL:[NSURL URLWithString:QC_NSStringFormat(@"%@%@",SERVERCE_ImageHost,model.goods_image)]];
    
    self.cell_name.text = model.goods_name;
    self.cell_price.text = [NSString stringWithFormat:@"¥%@",model.goods_price];
    self.cell_oldPrice.text = [NSString stringWithFormat:@"¥%@",model.market_price];
}

@end
