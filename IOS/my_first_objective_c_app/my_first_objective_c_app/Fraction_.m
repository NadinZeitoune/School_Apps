//
//  Fraction.m
//  my_first_objective_c_app
//
//  Created by hackeru on 25/03/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

#import "Fraction_.h"

@implementation Fraction
@synthesize numerator, denominator;

/*{// fields = private
    int numerator;
    int denominator;
}*/


// implementation the code for the methods above
- (void)print{
    NSLog(@"%i/%i", numerator, denominator);
}

- (double)toDouble
{
    if (denominator != 0)
        return (double) numerator / denominator;
    
    return NAN;
}

- (void)setNumerator:(int)n andDenominator:(int)d
{
    numerator = n;
    denominator = d;
}

- (void)add:(Fraction *)f
{
    numerator = numerator * f.denominator + denominator * f.numerator;
    denominator *= f.denominator;
}
@end
