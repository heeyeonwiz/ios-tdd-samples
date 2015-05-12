//
// Created by Jian Lv on 5/12/15.
// Copyright (c) 2015 Jian Lv. All rights reserved.
//

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
    NSNumber *reminderId = [_userDefaults objectForKey:@"currentReminderId"];
    if (reminderId) {
        return @([reminderId intValue] + 1);
    }
    [_userDefaults setObject:@0 forKey:@"currentReminderId"];
    return @0;
}

@end