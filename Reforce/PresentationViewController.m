//
//  PresentationViewController.m
//  Reforce
//
//  Created by Akhil Stanislavose on 18/04/14.
//  Copyright (c) 2014 Akhil Stanislavose. All rights reserved.
//

#import "PresentationViewController.h"

@interface PresentationViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation PresentationViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

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

@end
