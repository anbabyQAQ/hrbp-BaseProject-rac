/* !:
 * @FileName   :   HRHomeViewController.m
 * @ProjectName:   hrbp
 * @CreateDate :   Created by ___田玉龙___ on 2017/5/5.
 * @Copyright  :     Copyright © 2017年 tyl. All rights reserved.
 */

#import "HRHomeViewController.h"
#import "HTInfiniteCarouselView.h"
#import "HRCollectionViewBindingHelper.h"
#import "HRHomeViewModel.h"
#import "SDCycleScrollView.h"

@interface HRHomeViewController ()<UITableViewDelegate,UITextFieldDelegate,SDCycleScrollViewDelegate>

/**
 *  Banner
 */
@property (strong, nonatomic) SDCycleScrollView *bannerView;
/**
 *  轮播图
 */
@property (strong, nonatomic) UIView *headerView;
/**
 *  Collection
 */
@property (strong, nonatomic) UICollectionView *collectionView;
/**
 *  bind Collection
 */
@property (strong, nonatomic) HRCollectionViewBindingHelper *tripBindingHelper;
/**
 *  bind ViewModel
 */
@property (strong, nonatomic, readonly) HRHomeViewModel *viewModel;
/**
 *  banner图数据
 */
@property (strong, nonatomic) NSMutableArray *bannerData;
@end

@implementation HRHomeViewController
@dynamic viewModel;
#pragma mark - Life Cycle
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 如果你发现你的CycleScrollview会在viewWillAppear时图片卡在中间位置，调用此方法调整图片位置
    [self.bannerView adjustWhenControllerViewWillAppera];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = BA_White_Color;
    self.navigationItem.title = @"首页";

//    [self setNavigationBar];
    
}

#pragma mark - bind
- (void)bindViewModel
{
    [super bindViewModel];
    
    self.bannerView.imageURLSignal = RACObserve(self.viewModel, bannerData);
    
    [[self
      rac_signalForSelector:@selector(cycleScrollView:didSelectItemAtIndex:)
      fromProtocol:@protocol(SDCycleScrollViewDelegate)]
    	subscribeNext:^(RACTuple *tuple) {
            NSNumber *index = tuple.second;
            NSLog(@"---点击了第%d张图片", [index intValue]);
        }];
    
    self.tripBindingHelper = [HRCollectionViewBindingHelper bindWithCollectionView:self.collectionView dataSource:RACObserve(self.viewModel, travelData) selectionCommand:self.viewModel.detailCommand templateCellClassName:@"itemCell"];
    
}

#pragma mark - getter
- (UIView *)headerView
{
    return HT_LAZY(_headerView, ({
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT*0.27)];
        [view addSubview:self.bannerView];
        [self.view addSubview:view];
        view;
    }));
}
- (SDCycleScrollView *)bannerView
{
    return HT_LAZY(_bannerView, ({
        
        SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT*0.27) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
        cycleScrollView.currentPageDotImage = [UIImage imageNamed:@"pageControlCurrentDot"];
        cycleScrollView.pageDotImage = [UIImage imageNamed:@"pageControlDot"];
        [self.view addSubview:cycleScrollView];
        
        cycleScrollView;
    }));
}

- (UICollectionView *)collectionView{
    return HT_LAZY(_collectionView, ({
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        // 定义大小
        layout.itemSize = CGSizeMake(SCREEN_WIDTH*0.32, SCREEN_WIDTH*0.32);
        // 设置最小行间距
        layout.minimumLineSpacing = 20;
        // 设置垂直间距
        layout.minimumInteritemSpacing = 0;
        // 设置滚动方向（默认垂直滚动）
        //    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        // 设置边缘的间距，默认是{0，0，0，0}
        layout.sectionInset = UIEdgeInsetsMake(20, 40, 40, 40);
        
        UICollectionView *collectionview = [[UICollectionView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT*0.27+64, SCREEN_WIDTH, SCREEN_HEIGHT - (SCREEN_HEIGHT*0.27+64)) collectionViewLayout:layout];
        collectionview.backgroundColor = BA_White_Color;
        [self.view addSubview:collectionview];
        collectionview;
    }));
}
- (NSMutableArray *)bannerData
{
    return HT_LAZY(_bannerData, @[].mutableCopy);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
