//
//  CRYButton.m
//  Crystal
//
//  Created by Steffen on 20.03.14.
//  Copyright (c) 2014 Crystal Corp. All rights reserved.
//

#import "CRYButton.h"

@implementation CRYButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [CRYButton designButton:self];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [CRYButton designButton:self];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


+(void)designButton:(UIButton *)button
{
    if ([button.font.fontName hasSuffix:@"MediumP4"]) {
        button.font = [UIFont ProximaNovaCondSemiboldWithSize:button.font.pointSize];
    }
    if ([button.font.fontName hasSuffix:@"Light"]) {
        button.font = [UIFont ProximaNovaCondLightWithSize:button.font.pointSize];
    }
    else {
        button.font = [UIFont ProximaNovaCondRegularWithSize:button.font.pointSize];
    }
    
}



@end
