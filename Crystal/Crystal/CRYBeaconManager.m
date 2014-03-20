//
//  CRYBeaconManager.m
//  Crystal
//
//  Created by xcode on 20.03.14.
//  Copyright (c) 2014 Crystal Corp. All rights reserved.
//

#import "CRYBeaconManager.h"


@interface CRYBeaconManager ()

@end

@implementation CRYBeaconManager


-(instancetype)initWithUUID:(NSArray*) UUIDString majorNumber:(NSArray*) majorNumber minorNumber:(NSArray*)minorNumber identifier:(NSArray*)identifier
{
    self = [super init];
    if (self)
    {
        self.beaconManager = [[ESTBeaconManager alloc]init];
        self.beaconManager.delegate = self;
        self.beaconManager.avoidUnknownStateBeacons = YES;
        
        for (NSUInteger i=0; i<UUIDString.count; i++) {
            [self.UUID addObject:[[NSUUID alloc] initWithUUIDString:UUIDString[i]]];
            [self.major addObject:majorNumber[i]];
            [self.minor addObject:minorNumber[i]];
            [self.identifier addObject:identifier[i]];
            
            [self.beaconRegion addObject:[[ESTBeaconRegion alloc]initWithProximityUUID:self.UUID[i]
                                                                                 major:((NSNumber*)self.major[i]).shortValue
                                                                                 minor:((NSNumber*)self.minor[i]).shortValue
                                                                                identifier:self.identifier[i]]];
            [self.beaconManager startMonitoringForRegion:self.beaconRegion[i]];
            [self.beaconManager requestStateForRegion:self.beaconRegion[i]];
            [self.beaconManager startRangingBeaconsInRegion:self.beaconRegion[i]];
        }
        
    }
    return self;
}

-(void)beaconManager:(ESTBeaconManager *)manager didDetermineState:(CLRegionState)state forRegion:(ESTBeaconRegion *)region
{
    
    [self.delegate test];
    if (state == CLRegionStateInside) {
        //[self displayRegionAlert:region withTitle:@"did determine state - state inside"];
    }
    else if(state== CLRegionStateOutside)
    {
        //[self displayRegionAlert:region withTitle:@"did determine state - state outside"];
    }
    else if(state == CLRegionStateUnknown)
    {
        //[self displayRegionAlert:region withTitle:@"did determine state - state unknown"];
    }
}

-(void)beaconManager:(ESTBeaconManager *)manager didFailDiscoveryInRegion:(ESTBeaconRegion *)region
{
    //[self displayRegionAlert:region withTitle:@"did fail discovery in region"];
}
-(void)beaconManager:(ESTBeaconManager *)manager monitoringDidFailForRegion:(ESTBeaconRegion *)region withError:(NSError *)error
{
    //[self displayRegionAlert:region withTitle:@"monitor did fail for region"];
}

-(void)beaconManager:(ESTBeaconManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(ESTBeaconRegion *)region
{
    for (ESTBeacon* beacon  in beacons) {
        //NSString* string = [NSString stringWithFormat:@"UUID: %@, Distance: %@", beacon.proximityUUID.UUIDString, beacon.distance];
        //[self displayRegionAlert:region withTitle:string];
    }
    //   [self displayRegionAlert:<#(ESTBeaconRegion *)#> withTitle:<#(NSString *)#>]
}

-(void)beaconManager:(ESTBeaconManager *)manager didEnterRegion:(ESTBeaconRegion *)region
{
    //[self displayRegionAlert:region withTitle:@"did enter region"];
}
-(void)beaconManager:(ESTBeaconManager *)manager didExitRegion:(ESTBeaconRegion *)region
{
    //[self displayRegionAlert:region withTitle:@"did exit region"];
}

-(void)displayRegionAlert:(ESTBeaconRegion *)region withTitle:(NSString *)title
{
    NSString* s=[NSString stringWithFormat:@"%@ v%@.%@", region.identifier, region.major, region.minor];
    
    
    NSLog(@"%@, %@", title, s);
    //    [[[UIAlertView alloc] initWithTitle:title
    //                                message:s
    //                               delegate:nil
    //                      cancelButtonTitle:@"OK"
    //                      otherButtonTitles:nil] show];
}



@end
