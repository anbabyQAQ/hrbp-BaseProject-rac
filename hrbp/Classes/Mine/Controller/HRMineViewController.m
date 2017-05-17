/* !:
 * @FileName   :   HRMineViewController.m
 * @ProjectName:   hrbp
 * @CreateDate :   Created by ___田玉龙___ on 2017/5/5.
 * @Copyright  :     Copyright © 2017年 tyl. All rights reserved.
 */

#import "HRMineViewController.h"
#import "HTTableView.h"
#import "HTTableViewBindingHelper.h"
#import "HRMineViewModel.h"
#import "UserHeaderView.h"

@interface HRMineViewController ()<UITableViewDelegate>
/**
 *  headerview
 */
@property (strong, nonatomic) UIView *headerView;

/**
 *  UserHeaderView
 */
@property (strong, nonatomic) UserHeaderView *userheaderView;

/**
 *  scrollview
 */
@property (strong, nonatomic) UIScrollView *scrollView;
/**
 *  tableview
 */
@property (strong, nonatomic) HTTableView *tableView;
/**
 *  bind tableView
 */
@property (strong, nonatomic) HTTableViewBindingHelper *tripBindingHelper;
/**
 *  bind ViewModel
 */
@property (strong, nonatomic, readonly) HRMineViewModel *viewModel;
/**
 *  数据
 */
@property (strong, nonatomic) NSMutableArray *data;

/**
 *  logoutbtn
 */
@property (strong, nonatomic) UIButton *logoutButton;

@end

@implementation HRMineViewController
@dynamic viewModel;  //

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BA_White_Color;
    self.title = @"我的";

}

- (void)bindViewModel{
   
    [super bindViewModel];
    
//    self.userheaderView.userSignal = RACObserve(, )
    
    self.tripBindingHelper = [HTTableViewBindingHelper bindingHelperForTableView:self.tableView sourceSignal:RACObserve(self.viewModel, userData) selectionCommand:self.viewModel.detailCommand templateCell:@"UserSettingCell" withViewModel:self.viewModel];
    self.tripBindingHelper.delegate = self;
    
    [self.viewModel.requestDataCommand execute:@1];

    
    self.logoutButton.rac_command = self.viewModel.logoutCommand;

}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self.viewModel.requestDataCommand execute:@1];

}

- (UIButton *)logoutButton{
    return HT_LAZY(_logoutButton, ({
        
        // 登录按钮
        UIButton *logoutBt = [UIButton buttonWithType:UIButtonTypeCustom];
        logoutBt.backgroundColor = [UIColor whiteColor];
        logoutBt.frame = CGRectMake(20, SCREEN_HEIGHT-200, SCREEN_WIDTH-40, 44);
        [logoutBt setTitle:@"退出登录" forState:(UIControlStateNormal)];
        [logoutBt setTitleColor:[UIColor colorWithHexString:@"E66440"] forState:(UIControlStateNormal)];
        logoutBt.layer.cornerRadius = 6.f;
        logoutBt.layer.borderWidth = 0.5;
        logoutBt.layer.borderColor = [[UIColor colorWithHexString:@"E66440"] CGColor];
        [self.tableView addSubview:logoutBt];
        
        logoutBt;
    }));
}

- (UITableView *)tableView
{
    return HT_LAZY(_tableView, ({
        
        HTTableView *tableView = [[HTTableView alloc] initWithFrame:self.view.bounds];
//        tableView.tableHeaderView = self.headerView;
        tableView.rowHeight = SCREEN_HEIGHT*0.08;
        tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        [self.scrollView addSubview:tableView];
        tableView.tableHeaderView = self.headerView;
        UIView *view =[ [UIView alloc]init];
        view.backgroundColor = [UIColor clearColor];
        [tableView setTableFooterView:view];
        
        tableView;
    }));
}

#pragma mark - getter
- (UIView *)headerView
{
    return HT_LAZY(_headerView, ({
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 110)];
        view.backgroundColor = BA_CuttingModules_Color;
        [view addSubview:self.userheaderView];
        view;
    }));
}

- (UserHeaderView *)userheaderView{
    return HT_LAZY(_userheaderView, ({
    
        UserHeaderView *view = [[UserHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100)];
        view.backgroundColor = [UIColor whiteColor];
        
        /*! 登陆成功后，将数据库获取信息赋值给 BAUserModel，并发送通知 */
        [view setUserModel:USERSHARE];
        view;
    }));
}

- (UIScrollView *)scrollView{
    
    return HT_LAZY(_scrollView, ({
    
        UIScrollView *scrollview  = [[UIScrollView alloc]initWithFrame:self.view.bounds];
        scrollview.backgroundColor = BA_White_Color;
        [self.view addSubview:scrollview];
        scrollview;
    }));

}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
