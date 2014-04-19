//
//  PresentationViewController.m
//  Reforce
//
//  Created by Akhil Stanislavose on 18/04/14.
//  Copyright (c) 2014 Akhil Stanislavose. All rights reserved.
//

#import "PresentationViewController.h"
#import "AppDelegate.h"

@interface PresentationViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation PresentationViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    [(AppDelegate *)[[UIApplication sharedApplication] delegate] setHttpServerRootTo:self.presentation.path];

    [self configureView];
}

-(void) configureView {
    if (self.presentation)
        self.titleLabel.text = self.presentation.title;
}


- (IBAction)sliderValueChanged:(UISlider *)sender {
    if (sender.value == 100.0)
        [self dismissViewControllerAnimated:YES completion:nil];

}

-(void)viewDidDisappear:(BOOL)animated {
    [(AppDelegate *)[[UIApplication sharedApplication] delegate] resetHttpServerRoot];
}

@end
