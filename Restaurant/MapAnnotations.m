//
//  MapAnnotations.m
//  Restaurant
//
//  Created by Vladislav on 20.11.15.
//  Copyright © 2015 domik. All rights reserved.
//

#import "MapAnnotations.h"



@implementation MapAnnotations

@synthesize name = _name;
@synthesize address = _address;
@synthesize phone = _phone;
@synthesize coordinate = _coordinate;


- (id)initWithName:(NSString*)name address:(NSString*)address phone:(NSString*)phone coordinate:(CLLocationCoordinate2D)coordinate
{
    if ((self = [super init]))
    {
        _name = [name copy];
        _address = [address copy];
        _phone = [phone copy];
        _coordinate = coordinate;
    }
    
    return self;
}

- (NSString *)title
{
    if ([_name isKindOfClass:[NSNull class]])
        return @"Unknown charge";
    else
        return [NSString stringWithFormat:@"%@ Тел:%@", _name, _phone];//_name;
}

- (NSString *)subtitle
{
    return [NSString stringWithFormat:@"Адрес:%@", _address];
}


@end
