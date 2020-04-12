#import "TelephoneFinder.h"

@implementation TelephoneFinder
- (NSArray <NSString*>*)findAllNumbersFromGivenNumber:(NSString*)number {
    
    NSDictionary *neighbours = @{ @"0": @[@"8"], @"1": @[@"2", @"4"],@"2": @[@"1",@"3", @"5"], @"3": @[@"2", @"6"], @"4": @[@"1", @"5", @"7"], @"5": @[@"2", @"4", @"6", @"8"], @"6": @[@"3", @"5", @"9"], @"7": @[@"4", @"8"],@"8": @[@"5", @"7", @"9", @"0"], @"9": @[@"6", @"8"],};
    int zero = [number intValue];
    if (zero < 0) {
        return 0;
    }
    NSMutableArray *answer = [[NSMutableArray alloc] init];
    for (int i = 0 ; i < number.length; i++){
        NSRange range = NSMakeRange(i, 1);
        NSArray * neighbourNumber = [neighbours valueForKey:[number substringWithRange:range]];
        NSLog(@"%@", neighbourNumber);
        for (int n = 0; n < neighbourNumber.count; n++){
            NSString * numberToAdd = [number stringByReplacingCharactersInRange:range withString:neighbourNumber[n]];
            [answer addObject:numberToAdd];
        }
    }

    
    return answer;
}
@end
