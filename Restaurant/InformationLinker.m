//
//  InformationLinker.m
//  Restaurant
//
//  Created by Vladislav on 18.11.15.
//  Copyright © 2015 domik. All rights reserved.
//

#import "InformationLinker.h"

@implementation InformationLinker


- (instancetype)init
{
    if ( self = [super init] )
    {
        _linkerDict = [[NSMutableDictionary alloc] init];
        self.offersCount = 0;
        self.offerCount = 0;
    }
    
    return self;
}


- (void)addObjectsToDictionary
{
    if ( [self.linkerName isEqualToString:@"category"] )
    {
        [_linkerDict setObject:self.productName forKey:self.identificator];
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:self.identificator];
        self.linkerName = nil;
        self.identificator = nil;
        self.productName = nil;
    }
    if ( self.offerCount == 2 )
    {
        [_linkerDict setValue:self.productName forKey:@"name"];
        [_linkerDict setValue:self.price forKey:@"price"];
        [_linkerDict setValue:self.productDescription forKey:@"description"];
        [_linkerDict setValue:self.imageURL forKey:@"imgURL"];
        [_linkerDict setValue:self.categoryID forKey:@"categoryID"];
        [_linkerDict setValue:self.paramsArray forKey:@"params"];
        
        if ( [[NSUserDefaults standardUserDefaults] objectForKey:self.categoryID] == nil )
        {
            [[NSUserDefaults standardUserDefaults] setObject:[NSArray arrayWithObject:_linkerDict]
                                                      forKey:self.categoryID];
        } else
        {
            NSMutableArray *bufferArray = [NSMutableArray arrayWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:self.categoryID]];
            [bufferArray addObject:_linkerDict];
            [[NSUserDefaults standardUserDefaults] setObject:bufferArray forKey:self.categoryID];
        }
        
        [_linkerDict removeAllObjects];
        self.offerCount = 1;
        self.linkerName = nil;
        self.identificator = nil;
        self.productName = nil;
        self.price = nil;
        self.productDescription = nil;
        self.imageURL = nil;
        self.categoryID = nil;
        self.paramsArray = nil;
    }
}


- (void)addToUserDefaults
{
        [[NSUserDefaults standardUserDefaults] setObject:_linkerDict forKey:@"categories"];
        [_linkerDict removeAllObjects];
        self.linkerName = nil;
        self.identificator = nil;
        self.productName = nil;
}





@end
