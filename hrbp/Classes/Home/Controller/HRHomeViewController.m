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

@interface HRHomeViewController ()<UITableViewDelegate,UITextFieldDelegate>

/**
 *  Banner
 */
@property (strong, nonatomic) HTInfiniteCarouselView *bannerView;
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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = SetColor(251, 247, 237);
    self.navigationItem.title = @"首页";

//    [self setNavigationBar];
    
}

#pragma mark - bind
- (void)bindViewModel
{
    [super bindViewModel];

    self.bannerView.imageURLSignal = RACObserve(self.viewModel, bannerData);
    
    self.tripBindingHelper = [HRCollectionViewBindingHelper bindWithCollectionView:self.collectionView dataSource:RACObserve(self.viewModel, travelData) selectionCommand:self.viewModel.detailCommand templateCellClassName:@"itemCell"];
    
}

#pragma mark - getter
- (UIView *)headerView
{
    return HT_LAZY(_headerView, ({
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 180)];
        [view addSubview:self.bannerView];
        [self.view addSubview:view];
        view;
    }));
}
- (HTInfiniteCarouselView *)bannerView
{
    return HT_LAZY(_bannerView, ({
        
        HTInfiniteCarouselView *view = [[HTInfiniteCarouselView alloc] initWithFrame:CGRectMake(0, 10+64, SCREEN_WIDTH, 170)];
        view.cornerRadius = 5;
        view.autoScrollTimeInterval = 0.2;
        view.placeholder = @"tripdisplay_photocell_placeholder";
        [self.view addSubview:view];

        view;
    }));
}

- (UICollectionView *)collectionView{
    return HT_LAZY(_collectionView, ({
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        // 定义大小
        layout.itemSize = CGSizeMake(120, 120);
        // 设置最小行间距
        layout.minimumLineSpacing = 20;
        // 设置垂直间距
        layout.minimumInteritemSpacing = 0;
        // 设置滚动方向（默认垂直滚动）
        //    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        // 设置边缘的间距，默认是{0，0，0，0}
        layout.sectionInset = UIEdgeInsetsMake(40, 40, 40, 40);
        
        UICollectionView *collectionview = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 10+64+170, SCREEN_WIDTH, SCREEN_HEIGHT - (10+64+170)) collectionViewLayout:layout];
        collectionview.backgroundColor = SetColor(251, 247, 237);
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
