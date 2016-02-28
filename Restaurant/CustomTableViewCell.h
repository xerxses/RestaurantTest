//
//  CustomTableViewCell.h
//  Restaurant
//
//  Created by Vladislav on 19.11.15.
//  Copyright © 2015 domik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *weight;
@property (weak, nonatomic) IBOutlet UILabel *price;
@end
