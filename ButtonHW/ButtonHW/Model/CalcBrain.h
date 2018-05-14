//
//  CalcBrain.h
//  ButtonHW
//
//  Created by Ivan Kozaderov on 14.05.2018.
//  Copyright © 2018 n1ke71. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
typedef enum {
    
    OperationTypeNone,
    OperationTypeEquals,
    OperationTypePlus,
    OperationTypeMinus,
    OperationTypeMultiplication,
    OperationTypeDivision,
    OperationTypeMod,
    OperationTypeC,
    OperationTypePlusMinus,
    
}OperationType;

@class CalcBrain;
@protocol CalcBrainDelegate

-(NSString*)get:(CalcBrain*) brain digit:(NSInteger) digit;
-(NSString*)get:(CalcBrain*) brain operation:(NSInteger) operation;

@end

@interface CalcBrain : NSObject <CalcBrainDelegate>

@property(assign,nonatomic) OperationType operationType;
@property(assign,nonatomic) BOOL userInMiddleOfTyping;
@property(assign,nonatomic) BOOL pointAdded;
@property(assign,nonatomic) CGFloat firstOperand;
@property(assign,nonatomic) CGFloat secondOperand;
@property(assign,nonatomic) CGFloat result;
@property(strong,nonatomic) NSString* resultString;
@property(assign,nonatomic) CGFloat part;

@end


