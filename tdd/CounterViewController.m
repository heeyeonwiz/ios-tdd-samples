#import "CounterViewController.h"


@implementation CounterViewController {

}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)incrementCounter:(id)sender {
    int count = [self.counterLabel.text integerValue];
    self.counterLabel.text = [NSString stringWithFormat:@"%d", ++count];
}
@end