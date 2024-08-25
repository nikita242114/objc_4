#import "Robot.h"

@implementation Robot

- (instancetype)init {
    self = [super init];
    if (self) {
        self.x = 0;
        self.y = 0;
    }
    return self;
}

- (void)run:(NSString *(^)(void))movementBlock {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString *movement = movementBlock();
        
        if ([movement isEqualToString:@"up"]) {
            self.y++;
        } else if ([movement isEqualToString:@"down"]) {
            self.y--;
        } else if ([movement isEqualToString:@"left"]) {
            self.x--;
        } else if ([movement isEqualToString:@"right"]) {
            self.x++;
        }
        
        NSLog(@"Robot moved to x: %ld, y: %ld", (long)self.x, (long)self.y);
    });
}

- (void)printCurrentPosition {
    NSLog(@"Current position: x = %ld, y = %ld", (long)self.x, (long)self.y);
}

@end