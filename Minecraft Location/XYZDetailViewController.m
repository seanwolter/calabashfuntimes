//
//  XYZDetailViewController.m
//  Minecraft Location
//
//  Created by Sean Wolter on 1/30/13.
//  Copyright (c) 2013 VOKAL. All rights reserved.
//

#import "XYZDetailViewController.h"

@interface XYZDetailViewController ()
- (void)configureView;
@end

@implementation XYZDetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
