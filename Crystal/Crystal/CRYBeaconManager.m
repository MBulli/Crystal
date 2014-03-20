//
//  CRYBeaconManager.m
//  Crystal
//
//  Created by xcode on 20.03.14.
//  Copyright (c) 2014 Crystal Corp. All rights reserved.
//

#import "CRYBeaconManager.h"
#import "CRYBeaconObject.h"

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
        //self.beaconManager.avoidUnknownStateBeacons = YES;
        
        self.UUID = [[NSMutableArray alloc] init];
        self.major = [[NSMutableArray alloc]init];
        self.minor =[[NSMutableArray alloc]init];
        self.identifier = [[NSMutableArray alloc]init];
        self.beaconRegion = [[NSMutableArray alloc]init];
        
        for (NSUInteger i=0; i<UUIDString.count; i++) {
            [self.UUID addObject:[[NSUUID alloc] initWithUUIDString:UUIDString[i]]];
            [self.major addObject:majorNumber[i]];
            [self.minor addObject:minorNumber[i]];
            [self.identifier addObject:identifier[i]];
            
            [self.beaconRegion addObject:[[ESTBeaconRegion alloc]initWithProximityUUID:self.UUID[i]
                                                                                 major:((NSNumber*)self.major[i]).shortValue
                                                                                 minor:((NSNumber*)self.minor[i]).shortValue
                                                                                identifier:self.identifier[i]]];
            
            ESTBeaconRegion* beacon = (ESTBeaconRegion*)self.beaconRegion[i];
            [self.beaconManager startMonitoringForRegion:beacon];
            [self.beaconManager requestStateForRegion:beacon];
            [self.beaconManager startRangingBeaconsInRegion:beacon];
        }
        
    }
    return self;
}

-(void)beaconManager:(ESTBeaconManager *)manager didDetermineState:(CLRegionState)state forRegion:(ESTBeaconRegion *)region
{
    
    if (state == CLRegionStateInside) {
        CRYBeaconObject* beacon = [CRYBeaconObject beacon:region.proximityUUID.UUIDString];  
        NSLog(@"%@",[beacon articles].lastObject);
        self.isBeaconInRange = true;
    }
    else if(state== CLRegionStateOutside)
    {
        NSLog(@"Outside");
        //[self displayRegionAlert:region withTitle:@"did determine state - state outside"];
    }
    else if(state == CLRegionStateUnknown)
    {
        NSLog(@"Unkown");
        //[self displayRegionAlert:region withTitle:@"did determine state - state unknown"];
    }
}

-(void)beaconManager:(ESTBeaconManager *)manager didFailDiscoveryInRegion:(ESTBeaconRegion *)region
{
    [self displayRegionAlert:region withTitle:@"did fail discovery in region"];
}
-(void)beaconManager:(ESTBeaconManager *)manager monitoringDidFailForRegion:(ESTBeaconRegion *)region withError:(NSError *)error
{
    [self displayRegionAlert:region withTitle:@"monitor did fail for region"];
}

-(void)beaconManager:(ESTBeaconManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(ESTBeaconRegion *)region
{
    for (ESTBeacon* beacon  in beacons) {
    NSString* string = [NSString stringWithFormat:@"UUID: %@, Distance: %@", beacon.proximityUUID.UUIDString, beacon.distance];
    [self displayRegionAlert:region withTitle:string];
    }
      // [self displayRegionAlert:region withTitle:<#(NSString *)#>]
}

-(void)beaconManager:(ESTBeaconManager *)manager didEnterRegion:(ESTBeaconRegion *)region
{
    [self displayRegionAlert:region withTitle:@"did enter region"];
}
-(void)beaconManager:(ESTBeaconManager *)manager didExitRegion:(ESTBeaconRegion *)region
{
    [self displayRegionAlert:region withTitle:@"did exit region"];
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
