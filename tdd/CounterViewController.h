#import <UIKit/UIKit.h>

@interface CounterViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *counterLabel;
@property (weak, nonatomic) IBOutlet UIButton *plusButton;

- (IBAction)incrementCounter:(id)sender;
@end