#import <Foundation/Foundation.h>


@interface Example : NSObject
- (id)initWithUserDefaults:(NSUserDefaults *)defaults;
- (NSNumber *) nextReminderId;
@end