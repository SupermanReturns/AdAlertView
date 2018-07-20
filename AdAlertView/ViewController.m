//
//  ViewController.m
//  AdAlertView
//
//  Created by Superman on 2018/7/19.
//  Copyright © 2018年 Superman. All rights reserved.
//

#import "ViewController.h"
#import "AdModel.h"
#import "AdAlertView.h"
#import "WebVC.h"



@interface ViewController ()<AdAlertDelegate>
@property(nonatomic,strong)NSMutableArray *imgArr;
@property(nonatomic,strong)UIButton *showBtn;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.showBtn];
    
    _imgArr = [self setImgArr];
}
-(NSMutableArray *)setImgArr{
    NSMutableArray *arr = [[NSMutableArray alloc]initWithCapacity:0];
    for (int i = 1; i<=5; i++) {
        AdModel *adModel  = [[AdModel alloc]init];
        adModel.imgStr      = [NSString stringWithFormat:@"%d.png",i];
        adModel.linkUrl     = @"https://github.com/SupermanReturns/AdAlertView";
        [arr addObject:adModel];
    }
    return arr;
}
-(UIButton*)showBtn{
    if (!_showBtn) {
        _showBtn        = [UIButton buttonWithType:UIButtonTypeCustom];
        _showBtn.center = self.view.center;
        _showBtn.bounds = CGRectMake(0, 0, 100, 60);
        [_showBtn setTitle:@"弹出广告" forState:UIControlStateNormal];
        [_showBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [_showBtn addTarget:self action:@selector(showAdAlertView) forControlEvents:UIControlEventTouchUpInside];
    }
    return _showBtn;
}
-(void)showAdAlertView{
    [AdAlertView  showInView:self.view theDelegate:self theADInfo:_imgArr placeHolderImage:@"1.png"];
}
-(void)clickAlertViewAtIndex:(NSInteger)index{
    AdModel *adModel  = [_imgArr objectAtIndex:index];
    WebVC *webVC    = [[WebVC alloc]init];
    webVC.urlStr        = adModel.linkUrl;
    [self.navigationController pushViewController:webVC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
