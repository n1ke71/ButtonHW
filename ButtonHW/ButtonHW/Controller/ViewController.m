//
//  ViewController.m
//  ButtonHW
//
//  Created by Ivan Kozaderov on 14.05.2018.
//  Copyright © 2018 n1ke71. All rights reserved.
//

#import "ViewController.h"
#import "CalcBrain.h"

@interface ViewController ()

- (IBAction)digitPressed:(UIButton *)sender;
- (IBAction)operationPressed:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *indicatorLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttons;
@property(strong,nonatomic) CalcBrain* brain;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CalcBrain* brain = [[CalcBrain alloc]init];
    
    self.brain = brain;
    self.delegate = self.brain;
    
    // self.indicatorLabel.layer.cornerRadius = 20.f;
    
    for (UIButton* button in self.buttons) {
        
        button.layer.cornerRadius = 40.f;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)digitPressed:(UIButton *)sender {
    
    
    self.indicatorLabel.text = [self.delegate get:self.brain digit:sender.tag];
    
    
}
- (IBAction)operationPressed:(UIButton *)sender {
    
    self.indicatorLabel.text = [self.delegate get:self.brain operation:sender.tag];
    
    
}
@end

