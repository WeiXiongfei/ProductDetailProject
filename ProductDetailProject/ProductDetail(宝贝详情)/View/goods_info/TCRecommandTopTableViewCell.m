//
//  TCRecommandTopTableViewCell.m
//  TCMall
//
//  Created by Huazhixi on 2018/3/7.
//  Copyright © 2018年 HJB. All rights reserved.
//

#import "TCRecommandTopTableViewCell.h"
#import "QCBabyDeaityShopCell.h"

@interface TCRecommandTopTableViewCell ()<UICollectionViewDelegate,UICollectionViewDataSource>{
    
    BOOL _isTongLei;
}

@property (weak, nonatomic) IBOutlet UIView *collSupview;
@property (nonatomic,strong)UICollectionView *collectionView;

@property (weak, nonatomic) IBOutlet UIButton *xiangguanButton;

@property (weak, nonatomic) IBOutlet UIButton *tongleiButton;

@end
static NSString *QCBabyDeaityShopCellIdentifier = @"QCBabyDeaityShopCellIdentifier";
#define itemH 196
#define itemW 107
@implementation TCRecommandTopTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(BaseModel *)model{
    
    [self.collectionView reloadData];
}

- (void)setRecommentArr:(NSArray *)recommentArr{
    _recommentArr = recommentArr;
    [self.collectionView reloadData];
}

- (void)setCatCommentArr:(NSArray *)catCommentArr{
    _catCommentArr = catCommentArr;
}

/// 点击相关推荐
- (IBAction)xiangguanClickButton:(UIButton *)sender {
    _isTongLei = NO;
    self.xiangguanButton.titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Bold" size:16.f];
    self.xiangguanButton.titleLabel.textColor = [UIColor colorWithHexString:@"#1D2023"];
    
    self.tongleiButton.titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:13.f];
    self.tongleiButton.titleLabel.textColor = [UIColor colorWithHexString:@"#3F454B"];
    
    [self.collectionView reloadData];
}

/// 点击同类排行
- (IBAction)tongleiClickButton:(UIButton *)sender {
    _isTongLei = YES;
    
    self.tongleiButton.titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Bold" size:16.f];
    self.tongleiButton.titleLabel.textColor = [UIColor colorWithHexString:@"#1D2023"];
    
    self.xiangguanButton.titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:13.f];
    self.xiangguanButton.titleLabel.textColor = [UIColor colorWithHexString:@"#3F454B"];
    
    [self.collectionView reloadData];
}



#pragma mark-------UICollectionViewDelegate

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    
    return 10;
    
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    
    return 10;
    
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return CGSizeMake(itemW, itemH);
    
}

#pragma mark---didSelectItemAtIndexPat

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
 
}


#pragma mark ----UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;//设置section 个数
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (_isTongLei) {
        return self.catCommentArr.count;
    }else{
        return self.recommentArr.count;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    QCBabyDeaityShopCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:QCBabyDeaityShopCellIdentifier forIndexPath:indexPath];
    if (_isTongLei) {
        cell.model = self.catCommentArr[indexPath.row];
    }else{
        cell.model = self.recommentArr[indexPath.row];
    }
    
    return cell;
}




- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        
        
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 7, 0, 0);
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;//滑动的方向
        //初始化 UICollectionView
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, itemH) collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self; //设置代理
        _collectionView.dataSource = self;   //设置数据来源
        _collectionView.bounces = YES;   //设置弹跳
        _collectionView.alwaysBounceHorizontal = YES;
        _collectionView.showsHorizontalScrollIndicator = NO;
        //注册 cell  为了cell的重用机制  使用NIB  也可以使用代码 registerClass xxxx
        [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([QCBabyDeaityShopCell class]) bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:QCBabyDeaityShopCellIdentifier];
        [self.collSupview addSubview:_collectionView];
    }
    return _collectionView;
}




@end
