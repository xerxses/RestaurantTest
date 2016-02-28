//
//  DetailedViewController.m
//  Restaurant
//
//  Created by Vladislav on 19.11.15.
//  Copyright © 2015 domik. All rights reserved.
//

#import "DetailedViewController.h"
#import "SWRevealViewController.h"
#import "UIImageView+AFNetworking.h"

@interface DetailedViewController ()

@end

@implementation DetailedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    NSURL *url = [NSURL URLWithString:[self.dataDictionary objectForKey:@"imgURL"]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    UIImage *placeholderImage = [UIImage imageNamed:@"none"];
    
    __weak UIImageView *weakImage = self.foodImageView;
    
    // Do any additional setup after loading the view.
    [self.foodImageView setImageWithURLRequest:request
                          placeholderImage:placeholderImage
                                   success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image)
                                    {
                                       weakImage.image = image;
                                       [weakImage setNeedsLayout];
                                   } failure:nil];
    
    self.foodName.text = [self.dataDictionary objectForKey:@"name"];
    
    self.foodPrice.text = [self.dataDictionary objectForKey:@"price"];
    self.foodDescription.text = [self.dataDictionary objectForKey:@"description"];
    
    NSArray *otherParamsArray = [NSArray arrayWithArray:[self.dataDictionary objectForKey:@"params"]];
    
    for (NSUInteger i = 0; i < [otherParamsArray count]; i++)
    {
        if ( [otherParamsArray[i] isEqualToString:@"Вес"] )
        {
            self.foodWeight.text = [NSString stringWithFormat:@"%@ %@ %@", otherParamsArray[i], otherParamsArray[i+1], otherParamsArray[i+2]];
        }
        if ( [otherParamsArray[i] isEqualToString:@"Диаметр"] )
        {
            self.otherInfo1.text = [NSString stringWithFormat:@"%@ %@ %@", otherParamsArray[i], otherParamsArray[i+1], otherParamsArray[i+2]];
        }
        if ( [otherParamsArray[i] isEqualToString:@"Каллорийность"] )
        {
            self.otherInfo2.text = [NSString stringWithFormat:@"%@ %@", otherParamsArray[i], otherParamsArray[i+1]];
        }
        if ( [otherParamsArray[i] isEqualToString:@"Белки"] )
        {
            self.otherInfo3.text = [NSString stringWithFormat:@"%@ %@", otherParamsArray[i], otherParamsArray[i+1]];
        }
        if ( [otherParamsArray[i] isEqualToString:@"Жиры"] )
        {
            self.otherInfo4.text = [NSString stringWithFormat:@"%@ %@", otherParamsArray[i], otherParamsArray[i+1]];
        }
        if ( [otherParamsArray[i] isEqualToString:@"Углеводы"] )
        {
            self.otherInfo5.text = [NSString stringWithFormat:@"%@ %@", otherParamsArray[i], otherParamsArray[i+1]];
        }
        
    }
    
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
