//
//  NextViewController.m
//  ceshiDemo_Hsy
//
//  Created by chaojie on 2017/8/9.
//  Copyright © 2017年 chaojie. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()

@property(nonatomic,copy)NSArray *array;

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _array = @[@"one",@"two",@"three",@"four",@"five"];
    
    self.navigationItem.title = _test;
    
}

- (IBAction)btnClick:(id)sender {
    
//    if ([_delegate respondsToSelector:@selector(changeData:)]) {
//        
//        [_delegate changeData:_array];
//    }
    
//    NSDictionary *dic = [[NSDictionary alloc] initWithObjectsAndKeys:@"one",@"name",@"19",@"age", nil];
    NSDictionary *dic = @{@"name":@"one",@"age":@"18"};
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"huangshunyi" object:nil userInfo:dic];
    
    if (_block != nil) {
        self.block(_secondArr = @[@"ben",@"bne2",@"ben3",@"ben4",@"ben5"]);
        NSLog(@"_secondArr:%@",_secondArr);
    }
    
    
    [self.navigationController popViewControllerAnimated:YES];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
