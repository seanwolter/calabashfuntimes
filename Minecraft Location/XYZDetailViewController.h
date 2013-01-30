//
//  XYZDetailViewController.h
//  Minecraft Location
//
//  Created by Sean Wolter on 1/30/13.
//  Copyright (c) 2013 VOKAL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYZDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
