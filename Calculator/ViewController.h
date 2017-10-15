#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastActionLabel;

- (IBAction)digitAction:(id)sender;
- (IBAction)equalAction:(id)sender;
- (IBAction)clearAction:(id)sender;
- (IBAction)pointAction:(id)sender;
- (IBAction)changeSignAction:(id)sender;
- (IBAction)addAction:(id)sender;
- (IBAction)subAction:(id)sender;
- (IBAction)mulAction:(id)sender;
- (IBAction)divAction:(id)sender;
- (IBAction)percentAction:(id)sender;

@end

