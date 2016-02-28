//
//  MapViewController.m
//  Restaurant
//
//  Created by Vladislav on 19.11.15.
//  Copyright © 2015 domik. All rights reserved.
//

#import "MapViewController.h"
#import "SWRevealViewController.h"
#import "MapAnnotations.h"


#define METERS_MILE 1609.344
#define METERS_FEET 3.28084


@interface MapViewController ()

@end

@implementation MapViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[self map] setShowsUserLocation:YES];
    
    self.locationManager = [[CLLocationManager alloc] init];
    
    [[self locationManager] setDelegate:self];
    
    // we have to setup the location maanager with permission in later iOS versions
    if ([[self locationManager] respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [[self locationManager] requestWhenInUseAuthorization];
    }
    
    [[self locationManager] setDesiredAccuracy:kCLLocationAccuracyBest];
    [[self locationManager] startUpdatingLocation];
    
    
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = 53.913018;
    coordinate.longitude = 27.544291;
    MapAnnotations *annotation = [[MapAnnotations alloc] initWithName:@"MarkoPolo" address:@"Пр-т Пушкина 49" phone:@"+375291829311" coordinate:coordinate] ;
    [self.map addAnnotation:annotation];
    
    coordinate.latitude = 53.9339;
    coordinate.longitude = 27.544291;
    MapAnnotations *annotation1 = [[MapAnnotations alloc] initWithName:@"PoloMarko" address:@"Пр-т Пушкина 94" phone:@"+375291829311" coordinate:coordinate] ;
    [self.map addAnnotation:annotation1];
    
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
}

-(void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation *location = locations.lastObject;
    
    // zoom the map into the users current location
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, 2*METERS_MILE, 2*METERS_MILE);
    [[self map] setRegion:viewRegion animated:YES];
}


- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    
    static NSString *identifier = @"MyLocation";
    if ([annotation isKindOfClass:[MapAnnotations class]]) {
        
        MKPinAnnotationView *annotationView = (MKPinAnnotationView *) [self.map dequeueReusableAnnotationViewWithIdentifier:identifier];
        if (annotationView == nil) {
            annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        } else {
            annotationView.annotation = annotation;
        }
        
        annotationView.enabled = YES;
        annotationView.canShowCallout = YES;
       // annotationView.image=[UIImage imageNamed:@"arrest.png"];//here we use a nice image instead of the default pins
        
        return annotationView;
    }
    
    return nil;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
