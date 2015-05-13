#import "Counter.h"

NSString *const CounterModelChanged = @"CounterModelChanged";

@implementation Counter {

}
- (void)increment {
    [[NSNotificationCenter defaultCenter] postNotificationName:CounterModelChanged
                                                        object:self];
    _count += 1;
}
@end