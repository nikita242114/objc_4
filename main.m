#import <Foundation/Foundation.h>
#import "Robot.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Robot *robot = [[Robot alloc] init];
        
        NSString *(^movementBlock)(void) = ^NSString * {
            NSArray *movements = @[@"up", @"down", @"left", @"right"];
            NSUInteger randomIndex = arc4random_uniform((uint32_t)movements.count);
            return movements[randomIndex];
        };
        
        for (int i = 0; i < 10; i++) {
            [robot run:movementBlock];
            [robot printCurrentPosition];
        }
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            sleep(2); // Подождать некоторое время для завершения движения
            [robot printCurrentPosition];
        });
        
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:3]];
    }
    return 0;
}