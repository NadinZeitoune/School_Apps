//
//  Fraction.h
//  my_first_objective_c_app
//
//  Created by hackeru on 25/03/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fraction : NSObject
@property int numerator, denominator;
// public methods
-(void) print;
-(void)setNumerator: (int) n;
-(void)setDenominator: (int) d;
-(int) numerator;
-(int) denominator;
-(double) toDouble;
-(void) setNumerator: (int) n andDenominator: (int) d;
-(void) add: (Fraction *)f;
@end
