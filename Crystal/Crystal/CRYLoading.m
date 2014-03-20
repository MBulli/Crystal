//
//  CRYLoading.m
//  Crystal
//
//  Created by Markus on 3/20/14.
//  Copyright (c) 2014 Crystal Corp. All rights reserved.
//

#import "CRYLoading.h"

#import <CoreGraphics/CoreGraphics.h>

#import "Utilities.h"

@interface CRYLoading ()
{
    @private
    UIColor* c1;
    UIColor* c2;
    UIColor* c3;
}

@property(nonatomic, strong) CAShapeLayer *bobble1;
@property(nonatomic, strong) CAShapeLayer *bobble2;
@property(nonatomic, strong) CAShapeLayer *bobble3;

@property(nonatomic, strong) NSTimer *timer;

@end

@implementation CRYLoading

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadView];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self loadView];
    }
    return self;
}

-(void)loadView
{
    self.backgroundColor = [UIColor whiteBackground];
    
    c1 = [UIColor blueFontColor];
    c2 = [UIColor blueFontColor02];
    c3 = [UIColor blueFontColor03];
    
    CGFloat x = 8;
    CGFloat xd = 6;
    
    CGMutablePathRef path = CGPathCreateMutable();
    // 1
    CGPathMoveToPoint(path, NULL, 5, 0);
    CGPathAddLineToPoint(path, NULL, 0, 1.6);
    // 2
    CGPathAddLineToPoint(path, NULL, 0.8, 11.2);
    // 3
    CGPathAddLineToPoint(path, NULL, 8, 11.2);
    // 4
    CGPathAddLineToPoint(path, NULL, 5, 0);
    
    self.bobble1 = [[CAShapeLayer alloc] init];
    self.bobble1.path = CGPathCreateCopy(path);
    self.bobble1.fillColor = c1.CGColor;
    self.bobble1.affineTransform = CGAffineTransformMakeTranslation(0, 0);
    
    self.bobble2 = [[CAShapeLayer alloc] init];
    self.bobble2.path = CGPathCreateCopy(path);
    self.bobble2.fillColor = c2.CGColor;
    self.bobble2.affineTransform = CGAffineTransformMakeTranslation(1*(x+xd), 0);
    
    self.bobble3 = [[CAShapeLayer alloc] init];
    self.bobble3.path = CGPathCreateCopy(path);
    self.bobble3.fillColor = c3.CGColor;
    self.bobble3.affineTransform = CGAffineTransformMakeTranslation(2*(x+xd), 0);
    
    CGPathRelease(path);
    
    [self.layer addSublayer:self.bobble1];
    [self.layer addSublayer:self.bobble2];
    [self.layer addSublayer:self.bobble3];

    self.timer =[NSTimer timerWithTimeInterval:0.40
                                        target:self
                                      selector:@selector(timerTick)
                                      userInfo:nil
                                       repeats:YES];
    
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
}

-(void)timerTick
{
    static int i = 0;
    
    if (++i > 2) {
        i = 0;
    }
    
    switch (i) {
        case 0:
            self.bobble1.fillColor = c1.CGColor;
            self.bobble2.fillColor = c2.CGColor;
            self.bobble3.fillColor = c3.CGColor;
            break;
        case 1:
            self.bobble1.fillColor = c3.CGColor;
            self.bobble2.fillColor = c1.CGColor;
            self.bobble3.fillColor = c2.CGColor;
            break;
        case 2:
            self.bobble1.fillColor = c2.CGColor;
            self.bobble2.fillColor = c3.CGColor;
            self.bobble3.fillColor = c1.CGColor;
            break;
        default:
            break;
    }
}


@end
