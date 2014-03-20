//
//  CRYUserSettings.h
//  Crystal
//
//  Created by ich on 20.03.14.
//  Copyright (c) 2014 Crystal Corp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CRYUserSettings : NSObject
+(void)saveCategories:(NSArray*)categories;
+(NSArray*)loadCategories;
@end
