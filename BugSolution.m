```objectivec
#import <Foundation/Foundation.h>

@interface ClassA : NSObject
@property (nonatomic, strong) ClassB *classB;
- (void)doSomething;
@end

@implementation ClassA
- (instancetype)init {
    self = [super init];
    if (self) {
        _classB = [[ClassB alloc] initWithClassA:self];
    }
    return self;
}
- (void)doSomething {
    NSLog(@"ClassA doing something");
}
@end

@interface ClassB : NSObject
@property (nonatomic, weak) ClassA *classA; // Weak reference breaks the cycle
@end

@implementation ClassB
- (instancetype)initWithClassA:(ClassA *)classA {
    self = [super init];
    if (self) {
        _classA = classA;
    }
    return self;
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        ClassA *a = [[ClassA alloc] init];
        [a doSomething];
        a = nil; //Allows objects to be deallocated
    }
    return 0;
}
```