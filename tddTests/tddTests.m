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
    [MKTGiven([_mockUserDefault objectForKey:@"currentReminderId"]) willReturn:nil];
}

- (void)tearDown {
    _sut = nil;
    [super tearDown];
}

- (void)test_next_reminder_with_no_current_reminder_id_in_user_default_should_return_zero {
    //then
    HC_assertThat([_sut nextReminderId], HC_is(HC_equalTo(@0)));
}

- (void)test_next_reminder_with_no_current_reminder_id_in_user_default_should_save_zero_in_user_defaults {
    //when
    [_sut nextReminderId];

    //then
    [MKTVerify(_mockUserDefault) setObject:@0 forKey:@"currentReminderId"];
}


@end
