//
//  LoadViewController.m
//  Restaurant
//
//  Created by Vladislav on 18.11.15.
//  Copyright © 2015 domik. All rights reserved.
//

#import "LoadViewController.h"
#import "InformationParser.h"

@interface LoadViewController ()

@end

@implementation LoadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    InformationParser *parser = [[InformationParser alloc] init];
    parser.delegate = self;
    [parser downloadAndParse];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadingIsFinish:(BOOL)isFinish
{
    [self performSegueWithIdentifier:@"pushMain" sender:nil];
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
