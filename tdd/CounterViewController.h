#import <UIKit/UIKit.h>

@class Counter;

@interface CounterViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *counterLabel;
@property (weak, nonatomic) IBOutlet UIButton *plusButton;
@property (weak, nonatomic) IBOutlet UIButton *minusButton;

@property(nonatomic, strong) Counter *counter;

- (IBAction)incrementCounter:(id)sender;
- (IBAction)decrementCounter:(id)sender;

- (void)updateCounterLabel:(int)count;
@end