#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) NSString *valueOfResultLabel;
@property (strong, nonatomic) NSString *valueOfLastActionLabel;
@property (assign, nonatomic) double    firstValue;
@property (assign, nonatomic) double    secondValue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.valueOfResultLabel = @"0";
    self.valueOfLastActionLabel = @"";
    self.firstValue = 0.f;
    self.secondValue = 0.f;
    
    [self.resultLabel setText:self.valueOfResultLabel];
    [self.lastActionLabel setText:self.valueOfLastActionLabel];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)equalAction:(id)sender {
}


- (void)digitAction:(id)sender {
    NSString *enteredDigit = [NSString stringWithFormat:@"%ld", [sender tag]];
//    self.valueOfResultLabel = self.valueOfResultLabel + enteredDigit;
    self.resultLabel.text = [self.resultLabel.text stringByAppendingString:enteredDigit];
    
}

@end
