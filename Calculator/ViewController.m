#import "ViewController.h"

@interface ViewController ()

@property (assign, nonatomic) double    firstValue;
@property (assign, nonatomic) double    secondValue;
@property (assign, nonatomic) BOOL      valueWasEntered;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.firstValue = 0.f;
    self.secondValue = 0.f;
    self.valueWasEntered = NO;
    
    [self.resultLabel setText:@"0"];
    [self.lastActionLabel setText:@""];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)equalAction:(id)sender {
}


- (IBAction)clearAction:(id)sender {
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
    
    if (self.valueWasEntered &&
        [self.resultLabel.text length] == 1 &&
        [self.resultLabel.text characterAtIndex:0] == 48) {
        
        return;
    }
    
    NSString *enteredDigit = [NSString stringWithFormat:@"%ld", [sender tag]];
    self.resultLabel.text = [self.resultLabel.text stringByAppendingString:enteredDigit];
}

@end
