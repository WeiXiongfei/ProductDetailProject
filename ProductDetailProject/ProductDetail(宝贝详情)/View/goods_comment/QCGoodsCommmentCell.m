//
//  QCGoodsCommmentCell.m
//  QinCaoShop
//
//  Created by 张健 on 2019/6/17.
//  Copyright © 2019年 qincao. All rights reserved.
//

#import "QCGoodsCommmentCell.h"
#import "03 Constant.h"


@interface QCGoodsCommmentCell ()
@property (weak, nonatomic) IBOutlet UIImageView *icon;

@property (weak, nonatomic) IBOutlet UILabel *name;

@property (weak, nonatomic) IBOutlet UILabel *decs;

@property (weak, nonatomic) IBOutlet UIImageView *commentImage;
@property (weak, nonatomic) IBOutlet UILabel *imageCount;

@end

@implementation QCGoodsCommmentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    ViewBorderRadius(self, 4, 1, [UIColor colorWithHexString:@"#F5F5F5"]);
    ViewRadius(self.imageCount, 7.f);
    // Initialization code
}

- (void)setModel:(QCShopCommentModel *)model{
    _model = model;
    
    [self.icon sd_setImageWithURL:[NSURL URLWithString:model.head_img_url]];
    self.name.text = model.nickname;
    self.decs.text = model.content;
    if (model.img_list.count>0) {
        [self.commentImage sd_setImageWithURL:[NSURL URLWithString:QC_NSStringFormat(@"%@%@",SERVERCE_ImageHost,model.img_list[0][@"img_url"])]];
        self.imageCount.text = [NSString stringWithFormat:@"%ld张",model.img_list.count];
    }
}


@end
