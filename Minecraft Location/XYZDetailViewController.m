//
//  XYZDetailViewController.m
//  Minecraft Location
//
//  Created by Sean Wolter on 1/30/13.
//  Copyright (c) 2013 VOKAL. All rights reserved.
//

#import "XYZDetailViewController.h"
#import "MCPlayer.h"
#import "MCLocation.h"

@interface XYZDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *avatarImage;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
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
    if (self.detailItem) {
        MCPlayer *player = self.detailItem;
        self.titleLabel.text =player.name;
        self.locationLabel.text = [player.lastLocation locationString];
        [self loadAvatarImage];
    }
}

- (void)loadAvatarImage
{
    MCPlayer *player = self.detailItem;
    NSString *urlString = [NSString stringWithFormat:@"http://minecraft.aggenkeech.com/body.php?u=%@&s=128&r=255&g=250&b=238",player.name];
    NSURL *url = [NSURL URLWithString:urlString];

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSData *imageData = [NSData dataWithContentsOfURL:url];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.avatarImage.image = [UIImage imageWithData:imageData];
        });
    });
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

@end
