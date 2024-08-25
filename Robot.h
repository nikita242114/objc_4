#import <Foundation/Foundation.h>

@interface Robot : NSObject

@property (nonatomic, assign) NSInteger x;
@property (nonatomic, assign) NSInteger y;

- (void)run:(NSString *(^)(void))movementBlock;
- (void)printCurrentPosition;

@end