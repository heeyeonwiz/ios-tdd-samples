#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Example.h"

#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#define MOCKITO_SHORTHAND
#import <OCMockito/OCMockito.h>

@interface tddTests : XCTestCase

@end

@implementation tddTests {
    NSUserDefaults *_mockUserDefault;
    Example *_sut;
}

- (void)setUp {
    [super setUp];
    _mockUserDefault = MKTMock([NSUserDefaults class]);
    _sut = [[Example alloc] initWithUserDefaults:_mockUserDefault];
}

- (void)tearDown {
    _sut = nil;
    [super tearDown];
}

- (void)test_next_reminder_with_no_current_reminder_id_in_user_default_should_return_zero {
    [self setUpReminderId:nil];
    HC_assertThat([_sut nextReminderId], HC_is(HC_equalTo(@0)));
}

- (void)test_next_reminder_with_current_reminder_id_in_user_default_should_one_greater {
    NSNumber *reminderId = @3;
    [self setUpReminderId:reminderId];
    HC_assertThat([_sut nextReminderId], HC_is(HC_equalTo(@4)));
}

- (void)setUpReminderId:(NSNumber *)reminderId {
    [MKTGiven([_mockUserDefault objectForKey:@"currentReminderId"]) willReturn:reminderId];
}


- (void)test_next_reminder_with_no_current_reminder_id_in_user_default_should_save_zero_in_user_defaults {
    [self setUpReminderId:nil];
    [_sut nextReminderId];
    [MKTVerify(_mockUserDefault) setObject:@0 forKey:@"currentReminderId"];
}

- (void)test_next_reminder_with_current_reminder_id_in_user_default_should_save_greater_in_user_defaults {
    [self setUpReminderId:@3];
    [_sut nextReminderId];
    [MKTVerify(_mockUserDefault) setObject:@4 forKey:@"currentReminderId"];
}



@end
