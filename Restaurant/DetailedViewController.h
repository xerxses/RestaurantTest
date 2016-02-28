//
//  DetailedViewController.h
//  Restaurant
//
//  Created by Vladislav on 19.11.15.
//  Copyright © 2015 domik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailedViewController : UIViewController


@property (nonatomic, copy) NSDictionary *dataDictionary;
@property (weak, nonatomic) IBOutlet UIImageView *foodImageView;
@property (weak, nonatomic) IBOutlet UILabel *foodName;
@property (weak, nonatomic) IBOutlet UILabel *foodWeight;
@property (weak, nonatomic) IBOutlet UILabel *foodPrice;
@property (weak, nonatomic) IBOutlet UILabel *foodDescription;
@property (weak, nonatomic) IBOutlet UILabel *otherInfo1;
@property (weak, nonatomic) IBOutlet UILabel *otherInfo2;
@property (weak, nonatomic) IBOutlet UILabel *otherInfo3;
@property (weak, nonatomic) IBOutlet UILabel *otherInfo4;
@property (weak, nonatomic) IBOutlet UILabel *otherInfo5;


@end
