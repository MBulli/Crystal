//
//  CRYBeaconObject.m
//  Crystal
//
//  Created by ich on 19.03.14.
//  Copyright (c) 2014 Crystal Corp. All rights reserved.
//

#import "CRYBeaconObject.h"
#import "JSONKit.h"

@interface CRYBeaconObject()
@property (nonatomic, copy) NSString *__id;
-(NSString*)loadDataFromServer;
@end

@implementation CRYBeaconObject
@synthesize __id;

+(instancetype)beacon:(NSString*)beacon_id {
	CRYBeaconObject *obj = [[super alloc] init];
	if (obj) {
		obj.__id = beacon_id;
	}
	return obj;
}

-(NSString*)loadDataFromServer {
	NSString *path = [[NSBundle mainBundle] pathForResource:@"server_return_sample" ofType:@"json"];
	NSString *content = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
	return content;
}

-(NSArray*)articles {
	NSString *response = [self loadDataFromServer];
	return [response objectFromJSONString];
}

@end
