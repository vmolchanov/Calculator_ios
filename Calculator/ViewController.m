#import "ViewController.h"

@interface ViewController ()

@property (assign, nonatomic) double firstValue;
@property (assign, nonatomic) double secondValue;
@property (assign, nonatomic) BOOL   valueWasEntered;

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


- (IBAction)pointAction:(id)sender {
    NSString *point = @".";
    if (![self.resultLabel.text containsString:point]) {
        self.resultLabel.text = [self.resultLabel.text stringByAppendingString:point];
        self.valueWasEntered = YES;
    }
}


- (IBAction)changeSignAction:(id)sender {
    NSString *minus = @"-";
    if ([self.resultLabel.text containsString:minus]) {
        self.resultLabel.text = [self.resultLabel.text substringFromIndex:1];
    } else {
        self.resultLabel.text = [minus stringByAppendingString:self.resultLabel.text];
    }
}


- (void)digitAction:(id)sender {
    const NSInteger ZERO_CODE = 48;
    
    if (!self.valueWasEntered) {
        self.resultLabel.text = @"";
        self.valueWasEntered = YES;
    }
    
    if ([self.resultLabel.text length] == 9) {
        return;
    }
    
    if (self.valueWasEntered && [self.resultLabel.text length] == 1) {
        if ([self.resultLabel.text characterAtIndex:0] == ZERO_CODE) {
            self.resultLabel.text = @"";
        }
    }
    
    NSString *enteredDigit = [NSString stringWithFormat:@"%ld", [sender tag]];
    self.resultLabel.text = [self.resultLabel.text stringByAppendingString:enteredDigit];
}

@end
