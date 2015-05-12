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
    self.counterLabel.text = [NSString stringWithFormat:@"%d", _count];
}
@end