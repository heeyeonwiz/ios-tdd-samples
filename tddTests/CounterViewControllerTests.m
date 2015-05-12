#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#define MOCKITO_SHORTHAND
#import <OCMockito/OCMockito.h>
#import "CounterViewController.h"



@interface CounterViewControllerTests : XCTestCase

@end

@implementation CounterViewControllerTests {
    CounterViewController *_sut;
}

- (void)setUp {
    [super setUp];
    _sut = [self findController:@"counterViewController"];
    [_sut view];
}

- (void)tearDown {
    [super tearDown];
}

- (void)test_counter_label_should_be_connected {
    HC_assertThat(_sut.counterLabel, HC_is(HC_notNilValue()));
}

- (void)test_counter_label_default_text_should_be_zero {
    HC_assertThat(_sut.counterLabel.text, HC_is(@"0"));
}

- (void)test_plus_button_should_be_connected {
    HC_assertThat(_sut.plusButton, HC_is(HC_notNilValue()));
}

- (CounterViewController *)findController:(NSString *)controllerId {
    return [self findController:controllerId inStoryboard:@"Main"];
}

- (CounterViewController *)findController:(NSString *)controllerId inStoryboard:(NSString *)storyboard {
    return [[UIStoryboard storyboardWithName:storyboard bundle:[NSBundle mainBundle]]
            instantiateViewControllerWithIdentifier:controllerId];
}

@end
