//
//  WTCPlayerDetailsViewController.h
//  Storyboard
//
//  Created by wangtao on 14-1-9.
//  Copyright (c) 2014年 wangtao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WTCGamePickerViewController.h"

@class WTCPlayerDetailsViewController;
@class WTCPlayer;

@protocol PlayerDetailsViewControllerDelegate <NSObject>

- (void)playerDetailViewControllerDidCancel:(WTCPlayerDetailsViewController *)controller;
- (void)playerDetailViewController:(WTCPlayerDetailsViewController *)controller didAddPlayer:(WTCPlayer *)player;

@end

@interface WTCPlayerDetailsViewController : UITableViewController<WTCGamePickerViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *ibDetailLabel;
@property (weak, nonatomic) IBOutlet UITextField *ibPlayerNameTextField;
@property (nonatomic, weak) id<PlayerDetailsViewControllerDelegate> delegate;
- (IBAction)ibCancelAction:(id)sender;
- (IBAction)ibAddAction:(id)sender;

@end
