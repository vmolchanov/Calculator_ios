#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) NSString *valueOfResultLabel;
@property (strong, nonatomic) NSString *valueOfLastActionLabel;
@property (assign, nonatomic) double    firstValue;
@property (assign, nonatomic) double    secondValue;
@property (assign, nonatomic) BOOL      valueWasEntered;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.valueOfResultLabel = @"0";
    self.valueOfLastActionLabel = @"";
    self.firstValue = 0.f;
    self.secondValue = 0.f;
    self.valueWasEntered = NO;
    
    [self.resultLabel setText:self.valueOfResultLabel];
    [self.lastActionLabel setText:self.valueOfLastActionLabel];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)equalAction:(id)sender {
}

- (IBAction)clearAction:(id)sender {
    self.valueOfResultLabel = @"0";
    self.valueOfLastActionLabel = @"";
    self.resultLabel.text = @"0";
    self.lastActionLabel.text = @"";
    self.valueWasEntered = NO;
}


- (void)digitAction:(id)sender {
    if (!self.valueWasEntered) {
        self.resultLabel.text = @"";
        self.valueWasEntered = YES;
    }
    
    if ([self.resultLabel.text length] == 9) {
        return;
    }
    
    NSString *enteredDigit = [NSString stringWithFormat:@"%ld", [sender tag]];
    self.resultLabel.text = [self.resultLabel.text stringByAppendingString:enteredDigit];
    
}

@end
