#import "CounterViewController.h"


@implementation CounterViewController {
    int _count;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)incrementCounter:(id)sender {
    ++_count;
    [self updateCounterLabel: _count];
}

- (IBAction)decrementCounter:(id)sender {
    --_count;
    [self updateCounterLabel: _count];
}

- (void)updateCounterLabel: (int) count {
    UIColor *color = count == 0 ? [UIColor blackColor] :
            count > 0 ? [UIColor greenColor] : [UIColor redColor];

    self.counterLabel.text = [NSString stringWithFormat:@"%d", count];
    self.counterLabel.textColor = color;
}
@end