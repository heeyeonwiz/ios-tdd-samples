#import "CounterViewController.h"
#import "Counter.h"


@implementation CounterViewController {
    int _count;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(modelChanged:) name:CounterModelChanged object:nil];
}

- (void)modelChanged:(NSNotification *)notification {
    [self updateCounterLabel: _counter.count];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)incrementCounter:(id)sender {
    [_counter increment];
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