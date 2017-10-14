#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastActionLabel;

- (IBAction)digitAction:(id)sender;
- (IBAction)equalAction:(id)sender;
- (IBAction)clearAction:(id)sender;
- (IBAction)pointAction:(id)sender;

@end

