#import "Counter.h"

NSString *const CounterModelChanged = @"CounterModelChanged";

@implementation Counter

- (void)increment {
    _count += 1;
    [self postNotification];
}

- (void)decrement {
    _count -= 1;
    [self postNotification];
}

- (void)postNotification {
    [[NSNotificationCenter defaultCenter] postNotificationName:CounterModelChanged
                                                        object:self];
}
@end