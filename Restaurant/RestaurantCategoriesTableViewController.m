//
//  RestaurantCategoriesTableViewController.m
//  Restaurant
//
//  Created by Vladislav on 19.11.15.
//  Copyright © 2015 domik. All rights reserved.
//

#import "RestaurantCategoriesTableViewController.h"
#import "CustomTableViewCell.h"
#import "SWRevealViewController.h"
#import "UIImageView+AFNetworking.h"
#import "DetailedViewController.h"


@interface RestaurantCategoriesTableViewController ()

@end


@implementation RestaurantCategoriesTableViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _categoriesMenu = [NSArray arrayWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:self.categoryID]];
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _categoriesMenu.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *simpleTableIdentifier = @"CustomTableViewCell";
    
    CustomTableViewCell *cell = (CustomTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    NSDictionary *currentElement = [NSDictionary dictionaryWithDictionary:[_categoriesMenu objectAtIndex:indexPath.row]];
    NSArray *currentParams = [NSArray arrayWithArray:[currentElement objectForKey:@"params"]];
    
    NSURL *url = [NSURL URLWithString:[currentElement objectForKey:@"imgURL"]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    UIImage *placeholderImage = [UIImage imageNamed:@"none"];
    
    __weak UITableViewCell *weakCell = cell;
    
    [cell.imageView setImageWithURLRequest:request
                          placeholderImage:placeholderImage
                                   success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                       
                                       weakCell.imageView.image = image;
                                       [weakCell setNeedsLayout];
                                   } failure:nil];
    cell.name.text = [currentElement objectForKey:@"name"];
    cell.price.text = [currentElement objectForKey:@"price"];
    for (NSUInteger i = 0; i < [currentParams count]; i++)
    {
        if ( [currentParams[i] isEqualToString:@"Вес"] )
        {
            cell.weight.text = [NSString stringWithFormat:@"%@ %@ %@", currentParams[i], currentParams[i+1], ([currentParams[i+2] length] == 2) ? currentParams[i+2] : @"" ];
            break;
        }
    }
    
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"showDetails" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showDetails"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        DetailedViewController *detailedViewController = segue.destinationViewController;
        detailedViewController.dataDictionary = [NSDictionary dictionaryWithDictionary:[_categoriesMenu objectAtIndex:indexPath.row]];
    }
}



@end
