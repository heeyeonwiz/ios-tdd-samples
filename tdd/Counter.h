#import <Foundation/Foundation.h>

extern NSString *const CounterModelChanged;

@interface Counter : NSObject
@property(nonatomic) NSInteger count;

- (void)increment;
@end