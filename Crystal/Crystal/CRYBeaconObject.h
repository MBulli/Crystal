//
//  CRYBeaconObject.h
//  Crystal
//
//  Created by ich on 19.03.14.
//  Copyright (c) 2014 Crystal Corp. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CRYBeaconObject : NSObject
+(instancetype)beacon:(NSString*)beacon_id;
-(NSArray*)articles;
@end
