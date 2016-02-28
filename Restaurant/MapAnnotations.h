//
//  MapAnnotations.h
//  Restaurant
//
//  Created by Vladislav on 20.11.15.
//  Copyright © 2015 domik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <UIKit/UIKit.h>

@interface MapAnnotations : NSObject <MKAnnotation>
{
    NSString *_name;
    NSString *_address;
    NSString *_phone;
    CLLocationCoordinate2D _coordinate;
}

@property (copy) NSString *name;
@property (copy) NSString *address;
@property (copy) NSString *phone;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

- (id)initWithName:(NSString*)name address:(NSString*)address phone:(NSString*)tel coordinate:(CLLocationCoordinate2D)coordinate;


@end
