//
//  LoadViewController.h
//  Restaurant
//
//  Created by Vladislav on 18.11.15.
//  Copyright © 2015 domik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InformationParser.h"

@interface LoadViewController : UIViewController <InformationParserDelegate>


@property (weak, nonatomic) IBOutlet UISlider *loadingSlider;


@end
