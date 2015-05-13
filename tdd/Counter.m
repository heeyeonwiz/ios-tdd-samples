#import "Counter.h"

NSString *const CounterModelChanged = @"CounterModelChanged";

@implementation Counter {

}
- (void)increment {
    _count += 1;
    [[NSNotificationCenter defaultCenter] postNotificationName:CounterModelChanged
                                                        object:self];
}

- (void)decrement {
    _count -= 1;
    [[NSNotificationCenter defaultCenter] postNotificationName:CounterModelChanged
                                                        object:self];
}
@end