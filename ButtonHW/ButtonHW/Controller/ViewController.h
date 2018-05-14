//
//  ViewController.h
//  ButtonHW
//
//  Created by Ivan Kozaderov on 14.05.2018.
//  Copyright © 2018 n1ke71. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CalcBrainDelegate;

@interface ViewController : UIViewController

@property(strong,nonatomic) id <CalcBrainDelegate> delegate;

@end
