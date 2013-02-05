//
//  XYZMasterViewController.m
//  Minecraft Location
//
//  Created by Sean Wolter on 1/30/13.
//  Copyright (c) 2013 VOKAL. All rights reserved.
//

#import "XYZMasterViewController.h"
#import "XYZDetailViewController.h"
#import "MCPlayer.h"

@interface XYZMasterViewController ()
@property NSArray *playerArray;
@property (weak, nonatomic) IBOutlet UITableView *myTable;
@end

@implementation XYZMasterViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Players";
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSURL *url = [NSURL URLWithString:@"http://vokal-mapserve.jit.su/players"];
        NSData *data = [NSData dataWithContentsOfURL:url];
        NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        self.playerArray = [MCPlayer playersFromArray:jsonArray];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.myTable reloadData];
        });
    });
}

#pragma mark - Table View
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.playerArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    MCPlayer *player = [self.playerArray objectAtIndex:indexPath.row ];
    cell.textLabel.text = player.name;

    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        [[segue destinationViewController] setDetailItem:[self.playerArray objectAtIndex:indexPath.row ]];
    }
}

@end
