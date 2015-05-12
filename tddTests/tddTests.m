#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Example.h"

#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#define MOCKITO_SHORTHAND
#import <OCMockito/OCMockito.h>

@interface tddTests : XCTestCase

@end

@implementation tddTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)test_next_reminder_with_no_current_reminder_id_in_user_default_should_return_zero {
    //given
    NSUserDefaults *mockUserDefault = MKTMock([NSUserDefaults class]);
    Example *sut = [[Example alloc] initWithUserDefaults: mockUserDefault];

    [MKTGiven([mockUserDefault objectForKey:@"currentReminderId"]) willReturn:nil];
    //then
    HC_assertThat([sut nextReminderId], HC_is(HC_equalTo(@0)));
}

- (void)test_next_reminder_with_no_current_reminder_id_in_user_default_should_save_zero_in_user_defaults {
    //given
    NSUserDefaults *mockUserDefault = MKTMock([NSUserDefaults class]);
    Example *sut = [[Example alloc] initWithUserDefaults: mockUserDefault];

    [MKTGiven([mockUserDefault objectForKey:@"currentReminderId"]) willReturn:nil];

    //when
    [sut nextReminderId];

    //then
    [MKTVerify(mockUserDefault) setObject:@0 forKey:@"currentReminderId"];
}


@end
