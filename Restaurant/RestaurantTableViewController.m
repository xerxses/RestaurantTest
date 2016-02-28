//
//  RestaurantTableViewController.m
//  Restaurant
//
//  Created by Vladislav on 17.11.15.
//  Copyright © 2015 domik. All rights reserved.
//

#import "RestaurantTableViewController.h"
#import "RestaurantCategoriesTableViewController.h"
#import "SWRevealViewController.h"

@interface RestaurantTableViewController ()

@end

@implementation RestaurantTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    _tableInformation = [NSDictionary dictionaryWithDictionary:[[NSUserDefaults standardUserDefaults] objectForKey:@"categories"]];
    _keyArray = [_tableInformation allKeys];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _tableInformation.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [_tableInformation objectForKey:_keyArray[indexPath.row]];
    cell.imageView.image = [UIImage imageNamed:[_tableInformation objectForKey:_keyArray[indexPath.row]]];
    
    return cell;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"restaurantCategory"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        RestaurantCategoriesTableViewController *restCatTableViewController = segue.destinationViewController;
        restCatTableViewController.categoryID = [_keyArray objectAtIndex:indexPath.row];
    }
}


@end
