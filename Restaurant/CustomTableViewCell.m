//
//  CustomTableViewCell.m
//  Restaurant
//
//  Created by Vladislav on 19.11.15.
//  Copyright © 2015 domik. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell


@synthesize name = _name, image = _image, weight = _weight, price = _price;


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
