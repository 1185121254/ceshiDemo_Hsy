//
//  ViewController.m
//  ceshiDemo_Hsy
//
//  Created by chaojie on 2017/8/9.
//  Copyright © 2017年 chaojie. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "NextViewController.h"

@interface ViewController ()<NextViewControllerDelegate,UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,copy)Person *pp;

@property (weak, nonatomic) IBOutlet UILabel *label;

@property(nonatomic,copy)NSArray *aryData;

@end

@implementation ViewController

-(NSArray *)aryData{
    
    if (!_aryData) {
        _aryData = [[NSArray alloc] init];
    }
    
    return _aryData;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.title = @"title";
    
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rightBarBtnClcik:)];
    self.navigationItem.rightBarButtonItem = rightBar;
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(noti:) name:@"huangshunyi" object:nil];
    

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _aryData.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *str = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }

    cell.textLabel.text = _aryData[indexPath.row];
    
    return cell;
    
    
}
-(void)rightBarBtnClcik:(UIBarButtonItem *)barClcik{
    
    
//    NextViewController *nextVC = [[NextViewController alloc] init];
//    nextVC.delegate = self;
//    [self.navigationController pushViewController:nextVC animated:YES];
    
    
    __weak ViewController *blockSelf = self;
    
    NextViewController *nextVC = [[NextViewController alloc] init];
    
    nextVC.test = self.navigationItem.title;
    nextVC.block = ^(NSArray *arr) {
     
        blockSelf.aryData = arr;
        [_tableView reloadData];
        NSLog(@"blockSelf.aryData:%@",blockSelf.aryData);

    };
    
    [self.navigationController pushViewController:nextVC animated:YES];
    

}
-(void)noti:(NSNotification *)nofi{
    
    self.navigationItem.title = nofi.userInfo[@"name"];
    NSLog(@"nofi.object:%@",nofi.object);
    NSLog(@"nofi.name:%@",nofi.name);
    
}
-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"huangshunyi" object:nil];
}
-(void)changeData:(NSArray *)array{
    
    _aryData = array;
    [_tableView reloadData];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
