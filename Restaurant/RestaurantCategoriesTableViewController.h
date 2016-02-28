//
//  RestaurantCategoriesTableViewController.h
//  Restaurant
//
//  Created by Vladislav on 19.11.15.
//  Copyright © 2015 domik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RestaurantCategoriesTableViewController : UITableViewController
{
    NSArray *_categoriesMenu;
}

@property (nonatomic, copy) NSString *categoryID;


@end
