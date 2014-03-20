//
//  CRYDetail1Controller.h
//  Crystal
//
//  Created by Steffen on 20.03.14.
//  Copyright (c) 2014 Crystal Corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <QuartzCore/QuartzCore.h>
@interface CRYDetail1Controller : UIViewController <CLLocationManagerDelegate> {
	CLLocationManager *locationManager;
}
@property (nonatomic,retain) CLLocationManager *locationManager;
@property (weak, nonatomic) IBOutlet UIImageView *imim;


@end
