#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#define MOCKITO_SHORTHAND

#import <OCMockito/OCMockito.h>
#import "Counter.h"

@interface CounterTest : XCTestCase

@end

@implementation CounterTest {
    Counter *_counter;
    int modelChangedCounter;
    NSInteger modelChangedValue;
}

- (void)setUp {
    [super setUp];
    _counter = [[Counter alloc] init];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(counterModelChanged:)
                                                 name:CounterModelChanged
                                               object:_counter];
}

- (void)counterModelChanged:(NSNotification *) notification {
    ++modelChangedCounter;
    Counter *counter = notification.object;
    modelChangedValue = counter.count;
}

- (void)tearDown {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    _counter = nil;
    [super tearDown];
}

- (void)test_increment_1_should_yield_2 {
    _counter.count = 1;
    [_counter increment];

    HC_assertThatInteger(_counter.count, HC_is(HC_equalTo(@2)));
}

- (void)test_increment_2_should_yield_3 {
    _counter.count = 2;
    [_counter increment];

    HC_assertThatInteger(_counter.count, HC_is(HC_equalTo(@3)));
}

- (void)test_increment_should_post_model_changed_notification {
    [_counter increment];

    HC_assertThatInteger(modelChangedCounter, HC_is(HC_equalTo(@1)));
}

- (void)test_increment_should_post_mode_changed_notification_with_new_count {
    _counter.count = 1;
    [_counter increment];

    HC_assertThatInteger(modelChangedValue, HC_is(HC_equalTo(@2)));
}
@end
