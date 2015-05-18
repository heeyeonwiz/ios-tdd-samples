#import "Example.h"


@implementation Example {
    NSUserDefaults *_userDefaults;
}
- (id)initWithUserDefaults:(NSUserDefaults *)defaults {
    self = [super init];
    if (self) {
        _userDefaults = defaults;
    }
    return self;
}

- (NSNumber *)nextReminderId {
    NSNumber *reminderId = [self determineReminderId];
    [_userDefaults setObject:reminderId forKey:@"currentReminderId"];
    return reminderId;
}

- (NSNumber *)determineReminderId {
    NSNumber *reminderId = [_userDefaults objectForKey:@"currentReminderId"];
    reminderId = reminderId == nil ? @0 : @([reminderId intValue] + 1);
    return reminderId;
}

@end