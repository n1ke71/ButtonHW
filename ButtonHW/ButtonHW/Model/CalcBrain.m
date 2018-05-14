//
//  CalcBrain.m
//  ButtonHW
//
//  Created by Ivan Kozaderov on 14.05.2018.
//  Copyright © 2018 n1ke71. All rights reserved.
//

#import "CalcBrain.h"

@implementation CalcBrain

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.userInMiddleOfTyping = NO;
        self.pointAdded = NO;
        
        self.firstOperand  = 0.f;
        self.secondOperand = 0.f;
        self.result        = 0.f;
        self.resultString = @"0";
    }
    return self;
}

-(NSString*)get:(CalcBrain*) brain digit:(NSInteger) digit{
    
    
    if (!self.userInMiddleOfTyping)  {
        
        
        if ((digit == 10) && (!self.pointAdded)) {
            
            [self pointAddition:self.firstOperand];
        }
        
        else if (self.pointAdded){
            
            
            NSString* string   = [NSString stringWithFormat:@"%ld",digit];
            self.resultString  = [self.resultString stringByAppendingString:string];
            self.firstOperand  = [self.resultString floatValue];
        }
        
        
        else  {
            
            self.firstOperand  = self.firstOperand * 10 + digit;
            self.resultString  = [NSString stringWithFormat:@"%.0f",self.firstOperand];
            
        }
        
        
    }
    
    else {
        
        if ((digit == 10) && (!self.pointAdded)) {
            
            [self pointAddition:self.secondOperand];
        }
        
        else if (self.pointAdded){
            
            
            NSString* string   = [NSString stringWithFormat:@"%ld",digit];
            self.resultString  = [self.resultString stringByAppendingString:string];
            self.secondOperand = [self.resultString floatValue];
        }
        
        
        else  {
            
            self.secondOperand = self.secondOperand * 10 + digit;
            self.resultString  = [NSString stringWithFormat:@"%.0f",self.secondOperand];
            
        }
        
        
    }
    
    return self.resultString;
}
-(NSString*)get:(CalcBrain*) brain operation:(NSInteger) operation{
    
    
    
    return [self makeOperation:(int)operation];
    
}


-(NSString*) makeOperation:(OperationType)operation{
    
    
    if ((operation == OperationTypePlus)          |
        (operation == OperationTypeMinus)         |
        (operation == OperationTypeMultiplication)|
        (operation == OperationTypeDivision)) {
        self.operationType = operation;
        self.userInMiddleOfTyping = YES;
        self.pointAdded = NO;
        return self.resultString;
    }
    else if (operation == OperationTypeEquals){
        
        self.result = [self resultCounting:self.operationType];
        self.operationType = OperationTypeNone;
        self.userInMiddleOfTyping = YES;
        self.firstOperand  = self.result;
        self.resultString  = [NSString stringWithFormat:@"%.1f",self.result];
        self.secondOperand = 0.f;
        self.pointAdded = NO;
        
    }
    
    else if (operation == OperationTypeC){
        self.operationType = OperationTypeNone;
        self.userInMiddleOfTyping = NO;
        self.firstOperand  = 0.f;
        self.secondOperand = 0.f;
        self.result        = 0.f;
        self.pointAdded    = NO;
        
    }
    else if (operation == OperationTypeMod){
        
        self.result = [self modDivision:self.operationType withOperand:self.firstOperand];
        self.userInMiddleOfTyping = NO;
        self.operationType = OperationTypeNone;
        self.firstOperand  = self.result;
        self.resultString  = [NSString stringWithFormat:@"%.1f",self.result];
        self.secondOperand = 0.f;
        self.pointAdded = NO;
        
    }
    
    else if (operation == OperationTypePlusMinus){
        
        
        if (!self.userInMiddleOfTyping) {
            
            self.firstOperand  = self.firstOperand * -1.;
            self.resultString  = [NSString stringWithFormat:@"%.0f",self.firstOperand];
            return self.resultString;
        }
        else {
            
            
            self.secondOperand  = self.secondOperand * -1.;
            self.resultString  = [NSString stringWithFormat:@"%.0f",self.secondOperand];
            return self.resultString;
            
        }
        
    }
    
    
    return [NSString stringWithFormat:@"%.1f",self.result];
    
}

-(CGFloat) resultCounting:(OperationType) operation{
    
    CGFloat result = 0.f;
    
    if (operation == OperationTypePlus) {
        
        result =  self.firstOperand + self.secondOperand;
        
    }
    else if (operation == OperationTypeMinus){
        
        result = self.firstOperand - self.secondOperand;
    }
    
    else if (operation == OperationTypeMultiplication){
        
        result = self.firstOperand * self.secondOperand;
    }
    
    else if (operation == OperationTypeDivision){
        
        result = self.firstOperand / self.secondOperand;
    }
    
    
    return result;
}

-(void) pointAddition:(CGFloat) operand{
    
    NSRange range = [self.resultString rangeOfString:@"."];
    
    if (range.location == NSNotFound) {
        
        self.resultString = [self.resultString stringByAppendingString:@"."];
        operand      = [self.resultString floatValue];
        self.pointAdded   = YES;
        
    }
    
    
}

-(NSUInteger)modDivision:(OperationType) operation withOperand:(CGFloat) operand{
    
    return   (NSUInteger)operand % 2;
    
}
@end

