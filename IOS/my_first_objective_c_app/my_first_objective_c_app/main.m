//
//  main.m
//  my_first_objective_c_app
//
//  Created by hackeru on 25/03/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fraction_.h"


int main(int argc, const char * argv[]){
    @autoreleasepool {
        Fraction *f1 = [[Fraction alloc] init];
        Fraction *f2 = [[Fraction alloc] init];
        
        //fraction = [Fraction alloc];
        //fraction = [fraction init];
        [f1 setNumerator:2];
        [f1 setDenominator:3];
        [f1 print];
        
        [f2 setNumerator:1];
        [f2 setDenominator:5];
        [f2 print];
        
        NSLog(@"%i / %i", [f1 numerator], [f1 denominator]);
        
        int x = f1.numerator;
        f1.numerator = 19;
        
        [f1 setNumerator:3 andDenominator:7];
    }
    
    return 0;
}
