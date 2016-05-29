//
//  HotelProfileViewController+MapView.m
//  Rehberim
//
//  Created by Most Wanted on 06/05/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import "HotelProfileViewController+MapView.h"

@implementation HotelProfileViewController (MapView)

-(void)setupAndCreateMapView{

    MKPointAnnotation *myAnnotation = [[MKPointAnnotation alloc]init];
    
    
    MKPlacemark *source = [[MKPlacemark   alloc]initWithCoordinate:CLLocationCoordinate2DMake(41.6771,26.5557)   addressDictionary:[NSDictionary dictionaryWithObjectsAndKeys:@"",@"", nil] ];
    MKMapItem *srcMapItem = [[MKMapItem alloc]initWithPlacemark:source];
    [srcMapItem setName:@""];
    
    MKPlacemark *destination = [[MKPlacemark alloc]initWithCoordinate:CLLocationCoordinate2DMake(self.insideObject.latitude,self.insideObject.longitude) addressDictionary:[NSDictionary dictionaryWithObjectsAndKeys:@"",@"", nil] ];
    
    
    
    myAnnotation.coordinate = CLLocationCoordinate2DMake(self.insideObject.latitude,self.insideObject.longitude);
    myAnnotation.title = @"Camii";
    myAnnotation.subtitle = @"Selimiye Camii";
    [self.hotelMapView addAnnotation:myAnnotation];
    
    MKMapItem *distMapItem = [[MKMapItem alloc]initWithPlacemark:destination];
    [distMapItem setName:@""];
    
    MKDirectionsRequest *request = [[MKDirectionsRequest alloc]init];
    [request setSource:srcMapItem];
    [request setDestination:distMapItem];
    [request setTransportType:MKDirectionsTransportTypeWalking];
    
    MKDirections *direction = [[MKDirections alloc]initWithRequest:request];
    
    [direction calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse *response, NSError *error) {
        
        NSLog(@"response = %@",response);
        NSArray *arrRoutes = [response routes];
        [arrRoutes enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            
            MKRoute *rout = obj;
            
            MKPolyline *line = [rout polyline];
            
            [self.hotelMapView addOverlay:line];
            
            [self zoomToPolyLine:self.hotelMapView polyLine:line animated:true];
            
        }];
    }];
    
    self.hotelMapView.delegate = self;


}


#pragma mark - MapView


-(MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay{
    
    MKPolylineView *overlayView = [[MKPolylineView alloc] initWithPolyline:overlay];
    
    overlayView.lineWidth = 10.0f;
    
    overlayView.strokeColor = [[UIColor redColor] colorWithAlphaComponent:0.5f];
    
    overlayView.strokeColor = [UIColor redColor];
    
    return overlayView;
    
}

-(void)zoomToPolyLine: (MKMapView*)map polyLine: (MKPolyline*)polyLine animated:(BOOL)animated {
    MKPolygon* polygon = [MKPolygon polygonWithPoints:polyLine.points count:polyLine.pointCount];
    [map setRegion:MKCoordinateRegionForMapRect([polygon boundingMapRect]) animated:animated];
}


@end
