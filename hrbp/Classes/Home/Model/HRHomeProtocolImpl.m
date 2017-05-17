/* !:
 * @FileName   :   HRHomeProtocolImpl.m
 * @ProjectName:   hrbp
 * @CreateDate :   Created by ___田玉龙___ on 2017/5/5.
 * @Copyright  :     Copyright © 2017年 tyl. All rights reserved.
 */

#import "HRHomeProtocolImpl.h"
#import "HTBannerModel.h"
#import "HTItemModel.h"

@interface HRHomeProtocolImpl ()
/**
 *   banner数组
 */
@property (strong, nonatomic) NSMutableArray *bannerData;
/**
 *  item数组
 */
@property (strong, nonatomic) NSMutableArray *itemData;
/**
 *  首页model数据
 */
@property (strong, nonatomic) NSMutableDictionary *travelData;

@end


@implementation HRHomeProtocolImpl

- (RACSignal *)requestHomeDataSignal:(NSString *)requestUrl{
    
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        [self.bannerData removeAllObjects];
        [self.itemData removeAllObjects];
        
        
     //轮播图数据 （此处添加网络协议 ，可自行下载实现轮播）
        NSString *image_url = @"http://photos.breadtrip.com/covers_2017_04_28_9cbb1bfc26187566525118e052dca7f3.png?imageView2/2/w/750/format/jpg/interlace/1/";
        
        NSString *image_url2 = @"http://photos.breadtrip.com/covers_2015_06_12_2b36ddb1663ea627b3df21995fa64300.jpg?imageView2/2/w/750/format/jpg/interlace/1/";
        
        NSString *image_url3 = @"http://photos.breadtrip.com/covers_2015_03_11_d0531223309ab49b218aea7aee51b038.jpg?imageView2/2/w/750/format/jpg/interlace/1/";
        [self.bannerData addObjectsFromArray:@[image_url,image_url2,image_url3]];
        
        
        //collectionview数据
        HTItemModel *itemModel = [[HTItemModel alloc]init];
        itemModel.cover_image = @"地图";
        itemModel.name        = @"全景试图";
        itemModel.url        = @"https://www.baidu.com";
        [self.itemData addObject:itemModel];
        
        HTItemModel *itemModel2 = [[HTItemModel alloc]init];
        itemModel2.cover_image = @"用工规范";
        itemModel2.name        = @"员工规范";
        itemModel2.url        = @"https://www.baidu.com";
        [self.itemData addObject:itemModel2];
      
        HTItemModel *itemModel3 = [[HTItemModel alloc]init];
        itemModel3.cover_image = @"工作效能";
        itemModel3.name        = @"工作效能评估";
        itemModel3.url        = @"http//:192.168.18.248:8081/mts/testapp/view/map.html";
        [self.itemData addObject:itemModel3];
      
        HTItemModel *itemModel4 = [[HTItemModel alloc]init];
        itemModel4.cover_image = @"人员流动";
        itemModel4.name        = @"人员流动分析";
        itemModel4.url        = @"http//:192.168.18.248:8081/mts/testapp/view/map.html";
        [self.itemData addObject:itemModel4];
        
 
        
        [self.travelData setValue:self.bannerData forKey:BannerDatakey];
        [self.travelData setValue:self.itemData forKey:BusinessActionDatakey];
      
        [subscriber sendNext:self.travelData];
        [subscriber sendCompleted];
        
        return [RACDisposable disposableWithBlock:^{
//            [task cancel];
        }];
    }];
}
#pragma mark - getter
- (NSMutableArray *)bannerData
{
    return HT_LAZY(_bannerData, @[].mutableCopy);
}
- (NSMutableArray *)itemData
{
    return HT_LAZY(_itemData, @[].mutableCopy);
}
- (NSMutableDictionary *)travelData
{
    return HT_LAZY(_travelData, @{}.mutableCopy);
}
@end
