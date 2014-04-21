//
//  SettingsViewController.m
//  Reforce
//
//  Created by Akhil Stanislavose on 21/04/14.
//  Copyright (c) 2014 Akhil Stanislavose. All rights reserved.
//

#import "SettingsViewController.h"
#import "AppDelegate.h"

#import "Settings.h"

@interface SettingsViewController ()

@property (strong, nonatomic) Settings *settings;
@property (weak, nonatomic) IBOutlet UISwitch *enableUploadSwitch;

@end

@implementation SettingsViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

    self.settings = [Settings sharedManager];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    [self configureEnableUploadViews];
}

-(void)viewWillDisappear:(BOOL)animated {
    [self.settings save];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) configureEnableUploadViews {
    if ([self.settings isUploadEnabled])
        [self.enableUploadSwitch setOn:YES animated:YES];
    else [self.enableUploadSwitch setOn:NO animated:YES];
}

- (IBAction)enableUploadSwitchHandler:(UISwitch *)sender {
    self.settings.isUploadEnabled = sender.on;

    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    if(self.settings.isUploadEnabled)
        [appDelegate startHttpServer];
    else [appDelegate stopHttpServer];
}

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
