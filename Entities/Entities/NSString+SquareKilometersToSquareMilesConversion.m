//
//  NSString+NSString_SquareKilometersToSquareMilesConversion.m
//  Entities
//
//  Created by Julio Cesar Guzman Villanueva on 10/20/17.
//  Copyright © 2017 Julio Cesar Guzman Villanueva. All rights reserved.
//

#import "NSString+SquareKilometersToSquareMilesConversion.h"
#import <UIKit/UIKit.h>

@implementation NSString (SquareKilometersToSquareMilesConversion)

+ (nullable NSString *)squareMiles:(nonnull NSString *)squareKilometers {
    NSString *string = squareKilometers;
    NSString *pattern = @"(.*)SKM";
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern
                                                                           options:0
                                                                             error:NULL];
    NSTextCheckingResult *match = [regex firstMatchInString:string
                                                    options:0
                                                      range:NSMakeRange(0, [string length])];
    if (match == nil) { return nil; }
    
    NSString *kilometerString = [string substringWithRange:[match rangeAtIndex:1]];
    NSInteger kilometerAsInteger = [kilometerString integerValue];
    CGFloat kilometers = kilometerAsInteger;
    CGFloat milesPerKilometer = 0.3861;
    CGFloat miles = kilometers * milesPerKilometer;
    NSString *milesString = [NSString stringWithFormat:@"%f miles", miles];
    return milesString;
}

@end
