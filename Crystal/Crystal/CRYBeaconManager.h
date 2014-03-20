//
//  CRYBeaconManager.h
//  Crystal
//
//  Created by xcode on 20.03.14.
//  Copyright (c) 2014 Crystal Corp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ESTBeacon.h"
#import "ESTBeaconManager.h"
#import "ESTBeaconRegion.h"


@protocol CRYBeaconManagerDelegate <NSObject>

@end

@interface CRYBeaconManager : NSObject<ESTBeaconManagerDelegate>
-(instancetype)initWithUUID:(NSArray*) UUIDString majorNumber:(NSArray*) majorNumber minorNumber:(NSArray*)minorNumber identifier:(NSArray*)identifier;

@property(nonatomic, strong) NSMutableArray* UUID;
@property(nonatomic, strong) NSMutableArray* minor;
@property(nonatomic, strong) NSMutableArray* major;
@property(nonatomic, strong) ESTBeaconManager* beaconManager;
@property(nonatomic, strong) NSMutableArray* beaconRegion;
@property(nonatomic, strong) NSMutableArray* identifier;
@property(nonatomic, assign) BOOL isBeaconInRange;
@property(nonatomic, assign) BOOL isBeaconInRange2;

@property(nonatomic, weak) NSObject<CRYBeaconManagerDelegate> *delegate;
@end
