

#import "TCGoodsCommentListsCell.h"
//#import "NSString+HXExtension.h"
#import "03 Constant.h"
#import "02 Macro.h"
#import "UIImageView+WebCache.h"
#import "QCGoodsCommmentCell.h"

@interface TCGoodsCommentListsCell()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong)UICollectionView *collectionView;

@end

static NSString *QCGoodsCommmentCellIdentifier = @"QCGoodsCommmentCellIdentifier";
#define itemH 122
#define itemW 257

@implementation TCGoodsCommentListsCell

- (void)awakeFromNib {
    [super awakeFromNib];
  
    
}

- (void)setDataArr:(NSArray *)dataArr{
    
    _dataArr = dataArr;
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
    
    //    if ([self.delegate respondsToSelector:@selector(homeHeaderView:cycleScrollView:didSelectShufflingFigureModel:)]) {
    //
    //        [self.delegate homeHeaderView:self collectionView:collectionView didSelectWithData:self.couponDataArr[indexPath.row]];
    //    }
}


#pragma mark ----UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;//设置section 个数
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArr.count>5 ? 5 :self.dataArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    QCGoodsCommmentCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:QCGoodsCommmentCellIdentifier forIndexPath:indexPath];
     cell.model = self.dataArr[indexPath.row];
    
    return cell;
}


- (void)setCommentModel:(Comment *)commentModel {
 
    [self.collectionView reloadData];
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        
        
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 0);
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
        [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([QCGoodsCommmentCell class]) bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:QCGoodsCommmentCellIdentifier];
        [self.contentView addSubview:_collectionView];
    }
    return _collectionView;
}



@end
