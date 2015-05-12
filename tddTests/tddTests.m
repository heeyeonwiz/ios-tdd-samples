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
    [MKTGiven([_mockUserDefault objectForKey:@"currentReminderId"]) willReturn:nil];
    //then
    HC_assertThat([_sut nextReminderId], HC_is(HC_equalTo(@0)));
}

- (void)test_next_reminder_with_current_reminder_id_in_user_default_should_one_greater {
    [MKTGiven([_mockUserDefault objectForKey:@"currentReminderId"]) willReturn:@3];
    //then
    HC_assertThat([_sut nextReminderId], HC_is(HC_equalTo(@4)));
}


- (void)test_next_reminder_with_no_current_reminder_id_in_user_default_should_save_zero_in_user_defaults {
    [MKTGiven([_mockUserDefault objectForKey:@"currentReminderId"]) willReturn:nil];
    //when
    [_sut nextReminderId];

    //then
    [MKTVerify(_mockUserDefault) setObject:@0 forKey:@"currentReminderId"];
}


@end
