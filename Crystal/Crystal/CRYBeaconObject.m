//
//  CRYBeaconObject.m
//  Crystal
//
//  Created by ich on 19.03.14.
//  Copyright (c) 2014 Crystal Corp. All rights reserved.
//

#import "CRYBeaconObject.h"
#import "JSONKit.h"
#import "CRYUserSettings.h"

@interface CRYBeaconObject()
@property (nonatomic, copy) NSString *__id;
@property (nonatomic, strong) NSArray *__articles;
-(NSString*)loadDataFromServer;
@end

@implementation CRYBeaconObject
@synthesize __id, __articles, filteredArticles;

+(instancetype)beacon:(NSString*)beacon_id {
	CRYBeaconObject *obj = [[super alloc] init];
	if (obj) {
		obj.__id = beacon_id;
		obj.__articles = nil;
	}
	return obj;
}

-(NSString*)loadDataFromServer {
	NSString *path = [[NSBundle mainBundle] pathForResource:@"server_return_sample" ofType:@"json"];
	NSString *content = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
	return content;
}

-(NSArray*)articles {
	if (!__articles) {
		// don't ask the server for every request - caching
		NSString *response = [self loadDataFromServer];
		self.__articles = [response objectFromJSONString];
		self.filteredArticles = __articles;
	}
	return __articles;
}

-(NSArray*)advertisedArticles {
	NSArray *liked = [CRYUserSettings loadCategories];
	NSMutableArray *ret = [NSMutableArray array];
	
	for (NSDictionary* a in [self articles]) {
		if ([[a valueForKey:@"is_ad"] isEqualToNumber:@1]) {
			for (NSString *cat in [a valueForKey:@"category"]) {
				if ([liked containsObject:cat]) {
					[ret addObject:a];
				}
			}
		}
	}
	return ret;
}

-(void)filterArray:(NSString*)searchString {
	if (searchString.length<=0) {
		self.filteredArticles = __articles;
	} else {
		NSPredicate *pred = [NSPredicate predicateWithFormat:@"name CONTAINS[c] %@ || description CONTAINS[c] %@",searchString,searchString];
		self.filteredArticles = [self.articles filteredArrayUsingPredicate:pred];
	}
}

@end
