//
//  WTCPlayersViewController.m
//  Storyboard
//
//  Created by wangtao on 14-1-8.
//  Copyright (c) 2014年 wangtao. All rights reserved.
//

#import "WTCPlayersViewController.h"
#import "WTCPlayer.h"
#import "WTCPlayerCell.h"

@interface WTCPlayersViewController ()

- (UIImage *)imageForRating:(int)rating;

@end

@implementation WTCPlayersViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_players count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WTCPlayerCell *cell = (WTCPlayerCell *)[tableView dequeueReusableCellWithIdentifier:@"PlayerCell" forIndexPath:indexPath];
    WTCPlayer *player = (WTCPlayer *)[_players objectAtIndex:indexPath.row];
    // subtitle model
//    cell.textLabel.text = player.name;
//    cell.detailTextLabel.text = player.game;
    // custome model
//    UILabel *nameLabel = (UILabel *)[cell viewWithTag:100];
//    nameLabel.text = player.name;
//    UILabel *gameLabel = (UILabel *)[cell viewWithTag:101];
//    gameLabel.text = player.game;
//    UIImageView *ratingImage = (UIImageView *)[cell viewWithTag:102];
//    ratingImage.image = [self imageForRating:player.rating];
    
    // subclass UITableViewCell model
    cell.ibNameLabel.text = player.name;
    cell.ibGameLabel.text = player.game;
    cell.ibRatingImageView.image = [self imageForRating:player.rating];
    
    return cell;
}

- (UIImage *)imageForRating:(int)rating
{
    switch (rating) {
        case 1: return [UIImage imageNamed:@"1StarSmall"];
        case 2: return [UIImage imageNamed:@"2StarsSmall"];
        case 3: return [UIImage imageNamed:@"3StarsSmall"];
        case 4: return [UIImage imageNamed:@"4StarsSmall"];
        case 5: return [UIImage imageNamed:@"5StarsSmall"];
    }
    return nil;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}

// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}

#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
// The segue object containing information about the view controllers involved in the segue
// sender 绑定segue对象 此处是add按钮对象
// 调用此方法之前已经调用了destination view controller 的初始化方法 生成controller对象 懒加载
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSLog(@"prepareForSegue:segue:sender");
    if ([segue.identifier isEqualToString:@"AddPlayer"]) {
        UIBarButtonItem *item = (UIBarButtonItem *)sender;
        NSLog(@"tag=%d", item.tag);
        UINavigationController *navigationController = segue.destinationViewController;
        WTCPlayerDetailsViewController *detailsViewController = [navigationController viewControllers][0];
        detailsViewController.delegate = self;
    }
}

#pragma mark PlayerDetailsViewControllerDelegate

- (void)playerDetailViewControllerDidCancel:(WTCPlayerDetailsViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)playerDetailViewController:(WTCPlayerDetailsViewController *)controller didAddPlayer:(WTCPlayer *)player
{
    [_players addObject:player];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:([self.players count] - 1) inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
