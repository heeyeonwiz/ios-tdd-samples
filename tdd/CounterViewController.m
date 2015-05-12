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
    [self updateCounterLabel];
}

- (IBAction)decrementCounter:(id)sender {
    --_count;
    [self updateCounterLabel];
}

- (void)updateCounterLabel {
    UIColor *color = _count == 0 ? [UIColor blackColor] :
            _count > 0 ? [UIColor greenColor] : [UIColor redColor];

    self.counterLabel.text = [NSString stringWithFormat:@"%d", _count];
    self.counterLabel.textColor = color;
}
@end