#import <UIKit/UIKit.h>

@interface CounterViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *counterLabel;
@property (weak, nonatomic) IBOutlet UIButton *plusButton;
@property (weak, nonatomic) IBOutlet UIButton *minusButton;

- (IBAction)incrementCounter:(id)sender;
- (IBAction)decrementCounter:(id)sender;

- (void)updateCounterLabel:(int)count;
@end