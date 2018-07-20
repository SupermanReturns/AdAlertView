//
//  AdAlertView.h
//  AdAlertView
//
//  Created by Superman on 2018/7/20.
//  Copyright © 2018年 Superman. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol AdAlertDelegate <NSObject>

-(void)clickAlertViewAtIndex:(NSInteger)index;


@end

@interface AdAlertView : UIView
@property(nonatomic,assign)id<AdAlertDelegate> delegate;

+(AdAlertView *)showInView:(UIView *)view theDelegate:(id)delegate theADInfo: (NSArray *)dataList placeHolderImage: (NSString *)placeHolderStr;
@end


@interface ItemView : UIView

@property(nonatomic,assign)NSInteger index;//记录当前第几个item
@property(nonatomic,strong)UIImageView*imageView;//自定义视图

@end
