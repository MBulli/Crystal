//
//  CRYLabel.m
//  Crystal
//
//  Created by Steffen on 20.03.14.
//  Copyright (c) 2014 Crystal Corp. All rights reserved.
//

#import "CRYLabel.h"

@implementation CRYLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [CRYLabel designLabel:self];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [CRYLabel designLabel:self];
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


+(void)designLabel:(UILabel *)label
{
    if ([label.font.fontName hasSuffix:@"MediumP4"]) {
        label.font = [UIFont ProximaNovaCondSemiboldWithSize:label.font.pointSize];
    }
    if ([label.font.fontName hasSuffix:@"Light"]) {
        label.font = [UIFont ProximaNovaCondLightWithSize:label.font.pointSize];
    }
    else {
        label.font = [UIFont ProximaNovaCondRegularWithSize:label.font.pointSize];
    }
    
    label.textColor = [UIColor blueColor];
}

@end
