//
//  WTCPlayerDetailsViewController.m
//  Storyboard
//
//  Created by wangtao on 14-1-9.
//  Copyright (c) 2014年 wangtao. All rights reserved.
//

#import "WTCPlayerDetailsViewController.h"
#import "WTCGamePickerViewController.h"
#import "WTCPlayer.h"

@interface WTCPlayerDetailsViewController ()
{
    NSString *_game;
}

@end

@implementation WTCPlayerDetailsViewController

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

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        NSLog(@"init WTCPlayerDetailsViewController");
    }
    return self;
}

- (void)dealloc {
    NSLog(@"dealloc WTCPlayerDetailsViewController");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        [self.ibPlayerNameTextField becomeFirstResponder];
    }
}

#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSLog(@"destinationViewController=%@", [segue destinationViewController]);
    WTCGamePickerViewController *gamePickerViewController = (WTCGamePickerViewController *)[segue destinationViewController];
    gamePickerViewController.delegate = self;
    gamePickerViewController.game = @"Angry Birds";
}

- (IBAction)ibCancelAction:(id)sender {
    [self.delegate playerDetailViewControllerDidCancel:self];
}

- (IBAction)ibAddAction:(id)sender {
    WTCPlayer *player = [[WTCPlayer alloc] init];
    player.name = self.ibPlayerNameTextField.text;
    player.game = _game;
    player.rating = 3;
    [self.delegate playerDetailViewController:self didAddPlayer:player];
}

#pragma mark WTCGamePickerViewControllerDelegate
- (void)gamePickerViewController:(WTCGamePickerViewController *)controller didSelectedGame:(NSString *)game
{
    _game = game;
    self.ibDetailLabel.text = game;
    [self.navigationController popViewControllerAnimated:YES];
}

@end
