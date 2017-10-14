#import "ViewController.h"

@interface ViewController ()

@property (assign, nonatomic) double value;
@property (assign, nonatomic) BOOL   wasValueEntered;
@property (assign, nonatomic) BOOL   isAdd;
@property (assign, nonatomic) BOOL   isSub;
@property (assign, nonatomic) BOOL   isMul;
@property (assign, nonatomic) BOOL   isDiv;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.value = 0.f;
    self.wasValueEntered = NO;
    self.isAdd = NO;
    self.isSub = NO;
    self.isMul = NO;
    self.isDiv = NO;
    
    [self.resultLabel setText:@"0"];
    [self.lastActionLabel setText:@""];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)equalAction:(id)sender {
    if (self.isAdd) {
        self.value += [self.resultLabel.text doubleValue];
        self.resultLabel.text = [NSString stringWithFormat:@"%f", self.value];
    } else if (self.isSub) {
        self.value -= [self.resultLabel.text doubleValue];
        self.resultLabel.text = [NSString stringWithFormat:@"%f", self.value];
    } else if (self.isMul) {
        self.value *= [self.resultLabel.text doubleValue];
        self.resultLabel.text = [NSString stringWithFormat:@"%f", self.value];
    } else if (self.isDiv) {
        self.value /= [self.resultLabel.text doubleValue];
        self.resultLabel.text = [NSString stringWithFormat:@"%f", self.value];
    }
}


- (IBAction)clearAction:(id)sender {
    self.resultLabel.text = @"0";
    self.lastActionLabel.text = @"";
    self.wasValueEntered = NO;
}


- (IBAction)pointAction:(id)sender {
    NSString *point = @".";
    if (![self.resultLabel.text containsString:point]) {
        self.resultLabel.text = [self.resultLabel.text stringByAppendingString:point];
        self.wasValueEntered = YES;
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
    
    if (!self.wasValueEntered) {
        self.resultLabel.text = @"";
        self.wasValueEntered = YES;
    }
    
    if ([self.resultLabel.text length] == 9) {
        return;
    }
    
    if (self.wasValueEntered && [self.resultLabel.text length] == 1) {
        if ([self.resultLabel.text characterAtIndex:0] == ZERO_CODE) {
            self.resultLabel.text = @"";
        }
    }
    
    NSString *enteredDigit = [NSString stringWithFormat:@"%ld", [sender tag]];
    self.resultLabel.text = [self.resultLabel.text stringByAppendingString:enteredDigit];
}

@end
