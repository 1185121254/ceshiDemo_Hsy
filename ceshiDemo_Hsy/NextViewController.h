//
//  NextViewController.h
//  ceshiDemo_Hsy
//
//  Created by chaojie on 2017/8/9.
//  Copyright © 2017年 chaojie. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NextViewControllerDelegate <NSObject>

-(void)changeData:(NSArray *)array;

@end

@interface NextViewController : UIViewController

@property(nonatomic,weak)id<NextViewControllerDelegate> delegate;

@property(nonatomic,strong)NSArray *secondArr;

@property(nonatomic,copy)void(^block)(NSArray *arr);

@property(nonatomic,copy)NSString *test;

@end
