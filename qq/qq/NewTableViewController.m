//
//  NewTableViewController.m
//  qq
//
//  Created by 小强 on 16/12/7.
//  Copyright © 2016年 xiao. All rights reserved.
//

#import "NewTableViewController.h"
#import "NewCell.h"
#import "newModel.h"
#import "SessionManager.h"


@interface NewTableViewController ()

@property (nonatomic,strong)NSMutableArray *dataArray;

@end

@implementation NewTableViewController

-(NSMutableArray *)dataArray
{
    if (_dataArray ==nil) {
        _dataArray =[NSMutableArray new];
    }
    return _dataArray;
}

-(void)initData
{
     NSLog(@"_urlStr = %@",_urlStr);
    NSString *str =_urlStr;
    [[SessionManager shareManager]GET:str success:^(NSMutableArray *ary) {
       
        _dataArray =ary;
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self.tableView reloadData];
        });
        
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
        
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    self.tableView.rowHeight =150;
//    self.tableView.backgroundColor =[UIColor redColor];
    [self.tableView registerClass:[NewCell class] forCellReuseIdentifier:@"cell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    NSLog(@"%ld",_dataArray.count);
    return _dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    newModel *model =self.dataArray[indexPath.row];
    cell.model=model;
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
