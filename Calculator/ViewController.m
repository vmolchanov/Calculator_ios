#import "ViewController.h"

@interface ViewController ()

@property (assign, nonatomic) double firstValue;
@property (assign, nonatomic) double secondValue;
@property (assign, nonatomic) BOOL   wasValueEntered;
@property (assign, nonatomic) BOOL   isAdd;
@property (assign, nonatomic) BOOL   isSub;
@property (assign, nonatomic) BOOL   isMul;
@property (assign, nonatomic) BOOL   isDiv;
@property (assign, nonatomic) BOOL   isEqual;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setInitialValues];
}


- (void)setInitialValues {
    self.firstValue = 0.f;
    self.secondValue = 0.f;
    [self setFlagAddAs:NO subAs:NO mulAs:NO divAs:NO equalAs:NO valueEnteredAs:NO];
    self.resultLabel.text = @"0";
    self.lastActionLabel.text = @"";
}


- (void)setFlagAddAs:(BOOL)addFlag subAs:(BOOL)subFlag mulAs:(BOOL)mulFlag divAs:(BOOL)divFlag equalAs:(BOOL)equalFlag valueEnteredAs:(BOOL) valueEnteredFlag {
    self.isAdd = addFlag;
    self.isSub = subFlag;
    self.isMul = mulFlag;
    self.isDiv = divFlag;
    self.isEqual = equalFlag;
    self.wasValueEntered = valueEnteredFlag;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)equalAction:(id)sender {
    if (!self.isEqual) {
        if (!self.isAdd && !self.isSub && !self.isMul && !self.isDiv) {
            return;
        }
        
        self.secondValue = self.wasValueEntered ? [self.resultLabel.text doubleValue] : self.firstValue;
        self.isEqual = YES;
    }
    
    if (self.isAdd) self.firstValue += self.secondValue;
    if (self.isSub) self.firstValue -= self.secondValue;
    if (self.isMul) self.firstValue *= self.secondValue;
    if (self.isDiv) self.firstValue /= self.secondValue;
    
    if (!sender) {
        [self setFlagAddAs:NO subAs:NO mulAs:NO divAs:NO equalAs:NO valueEnteredAs:NO];
    }
    
    self.lastActionLabel.text = [NSString stringWithFormat:@"%@ %@ =",
                                 self.lastActionLabel.text,
                                 self.resultLabel.text];
    self.resultLabel.text = [NSString stringWithFormat:@"%g", self.firstValue];
}


- (IBAction)clearAction:(id)sender {
    [self setInitialValues];
}


- (IBAction)pointAction:(id)sender {
    NSString *point = @".";
    if (![self.resultLabel.text containsString:point]) {
        self.resultLabel.text = [self.resultLabel.text stringByAppendingString:point];
    }
}


- (IBAction)changeSignAction:(id)sender {
    NSString *sign = @"-";
    if ([self.resultLabel.text containsString:sign]) {
        self.resultLabel.text = [self.resultLabel.text substringFromIndex:1];
    } else {
        self.resultLabel.text = [sign stringByAppendingString:self.resultLabel.text];
    }
}


- (IBAction)addAction:(id)sender {
    if (self.isAdd) {
        [self equalAction:nil];
    }
    
    [self setFlagAddAs:YES subAs:NO mulAs:NO divAs:NO equalAs:NO valueEnteredAs:NO];
    self.firstValue = [self.resultLabel.text doubleValue];
    self.lastActionLabel.text = [NSString stringWithFormat:@"%g +", self.firstValue];
}


- (IBAction)subAction:(id)sender {
    if (self.isSub) {
        [self equalAction:nil];
    }
    
    [self setFlagAddAs:NO subAs:YES mulAs:NO divAs:NO equalAs:NO valueEnteredAs:NO];
    self.firstValue = [self.resultLabel.text doubleValue];
    self.lastActionLabel.text = [NSString stringWithFormat:@"%g -", self.firstValue];
}


- (IBAction)mulAction:(id)sender {
    if (self.isMul) {
        [self equalAction:nil];
    }
    
    [self setFlagAddAs:NO subAs:NO mulAs:YES divAs:NO equalAs:NO valueEnteredAs:NO];
    self.firstValue = [self.resultLabel.text doubleValue];
    self.lastActionLabel.text = [NSString stringWithFormat:@"%g x", self.firstValue];
}


- (IBAction)divAction:(id)sender {
    if (self.isDiv) {
        [self equalAction:nil];
    }
    
    [self setFlagAddAs:NO subAs:NO mulAs:NO divAs:YES equalAs:NO valueEnteredAs:NO];
    self.firstValue = [self.resultLabel.text doubleValue];
    self.lastActionLabel.text = [NSString stringWithFormat:@"%g /", self.firstValue];
}


- (IBAction)percentAction:(id)sender {
    self.lastActionLabel.text = [NSString stringWithFormat:@"%@%% =", self.resultLabel.text];
    double value = [self.resultLabel.text doubleValue] / 100;
    self.resultLabel.text = [NSString stringWithFormat:@"%g", value];
}


- (void)digitAction:(id)sender {
    if (!self.wasValueEntered) {
        self.wasValueEntered = YES;
        self.resultLabel.text = @"";
    }
    if ([sender tag] == 0 &&
        ([self.resultLabel.text isEqualToString:@"0"] || [self.resultLabel.text isEqualToString:@"-0"])) {
        
        return;
    }
    if ([sender tag] != 0 && [self.resultLabel.text isEqualToString:@"0"]) {
        self.resultLabel.text = @"";
    }
    if ([sender tag] != 0 && [self.resultLabel.text isEqualToString:@"-0"]) {
        self.resultLabel.text = @"-";
    }
    
    NSString *enteredDigit = [NSString stringWithFormat:@"%ld", [sender tag]];
    self.resultLabel.text = [self.resultLabel.text stringByAppendingString:enteredDigit];
}

@end
