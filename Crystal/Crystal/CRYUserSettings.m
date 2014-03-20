//
//  CRYUserSettings.m
//  Crystal
//
//  Created by ich on 20.03.14.
//  Copyright (c) 2014 Crystal Corp. All rights reserved.
//

#import "CRYUserSettings.h"
#import "JSONKit.h"

@interface CRYUserSettings()

@end

@implementation CRYUserSettings

+(void)saveCategories:(NSArray*)categories {
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	[defaults setObject:categories forKey:@"categories"];
	[defaults synchronize];
}

+(NSArray*)loadCategories {
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	return [defaults arrayForKey:@"categories"];
}

+(NSArray*)fehlAmPlatzAberIrgendwoMuessenDieKategorienHin {
	NSString *path = [[NSBundle mainBundle] pathForResource:@"categories" ofType:@"json"];
	NSString *content = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
	
	return [content objectFromJSONString];
}


@end
