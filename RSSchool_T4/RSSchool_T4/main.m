#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        
        NSArray *itemsFromArray = [NSArray arrayWithObjects: @1, @2, @3, nil];
        int numberOfItems = 3;
                            //6
        
//        NSArray *itemsFromArray = [NSArray arrayWithObjects: @-100, @-2, @50, @-7, @1, @3, @10, nil];
//               int numberOfItems = 4;
                            //350000
//
//        NSArray *itemsFromArray = [NSArray arrayWithObjects: @-1000000, @20, @5, @1, @7, @5, nil];
//               int numberOfItems = 3;
            //700
        
//        NSArray *itemsFromArray = [NSArray arrayWithObjects: @-100, @50, @30, @20, @40, @-1, nil];
//               int numberOfItems = 3;
            //60000
        
//        NSArray *itemsFromArray = [NSArray arrayWithObjects: @"1", @"2", @"3", nil];
//               int numberOfItems = 3;
            //0 by def
        
//        NSArray *itemsFromArray = [NSArray arrayWithObjects: @-1, @"2", @"3", @4, nil];
//               int numberOfItems = 3;
            //-4
        
//        NSArray *itemsFromArray = [NSArray arrayWithObjects: @1, @2, @3, nil];
//               int numberOfItems = 4;
                    //6

        
//ЧИСТИМ ОТ СТРИНГОВ
        NSMutableArray *arrayWithoutStrings = [[NSMutableArray alloc] init];
        for (int i=0; i<itemsFromArray.count; i++) {
            if ([[itemsFromArray objectAtIndex:i] isKindOfClass:[NSNumber class]]) {
                [arrayWithoutStrings addObject:[itemsFromArray objectAtIndex:i]];
            }
        }
        NSLog(@"БЕЗ СТРИНГОВ%@",arrayWithoutStrings);
        NSArray *unsortedArray = [[NSArray alloc] initWithArray:arrayWithoutStrings];
        NSLog(@"НЕСОРТИРОВАННАЯ %@",unsortedArray);
       
//СОРТИРОВКА
        NSArray *sortedArray = [unsortedArray sortedArrayUsingComparator: ^NSComparisonResult(id obj1, id obj2) {
            if ([obj1 integerValue] < [obj2 integerValue]) {
                return NSOrderedAscending;
            } else if ([obj1 integerValue] > [obj2 integerValue]) {
                return NSOrderedDescending;
            } else {
                return NSOrderedSame;
        } }];
        NSLog(@"%@", sortedArray);

// ЗАГОТОВОЧКИ
        int numberOfnegativeValues = 0;
        int answer = 1;
        if (arrayWithoutStrings.count==0) {
                   answer = 0;
               }
        for (int i=0; i<sortedArray.count; i++) {
            if ([[sortedArray objectAtIndex:i] intValue] <0) {
                numberOfnegativeValues +=1;
            }
        }
//ПЕРЕСЧИТАЕМ numberOfItems
        if (numberOfItems>sortedArray.count) {
            NSLog(@"ЧИСЛО %d СОРТИРОВАННЫЕ %d", numberOfItems, sortedArray.count);
            NSLog(@"СОРТИРОВАННЫЕ %d",sortedArray.count);
            numberOfItems=sortedArray.count;
        }
//ЧИСТИМ ОТ СТРИНГОВ


//ПЕРВОРАЧИВАЕМ
        NSArray *reversedArray = [sortedArray.reverseObjectEnumerator allObjects];

       
        if (numberOfnegativeValues>0) {
            NSLog(@"РАБОТАЕТ КОЛИЧЕСТВО НЕГАТИВОК  %d", numberOfnegativeValues);
            int multiplyOfNegatives = 1;
            
            if (numberOfnegativeValues % 2 ==0) {
                 NSLog(@"ЦЕЛОЕ");
                for (int i=0; i<numberOfnegativeValues; i++) {
                multiplyOfNegatives = multiplyOfNegatives * [[sortedArray objectAtIndex:i] intValue];
                }
            } else {
                NSLog(@"НЕ ЦЕЛОЕ");
                if (numberOfnegativeValues>1) {
                for (int i=0; i<numberOfnegativeValues-1; i++) {
                multiplyOfNegatives = multiplyOfNegatives * [[sortedArray objectAtIndex:i] intValue];
                }
                } else {
                    multiplyOfNegatives= [[sortedArray objectAtIndex:0] intValue];
                }
            }
            
            NSLog(@"НЕГАТИВНЫЕ  %d", multiplyOfNegatives);
            
            int multiplyOfPositives = 1;
            for (int i=0; i<numberOfItems; i++) {
            multiplyOfPositives = multiplyOfPositives * [[reversedArray objectAtIndex:i] intValue];
            }
            NSLog(@"ПОЗИТИВНЫЕ  %d", multiplyOfPositives);
            
            if (multiplyOfPositives<([[reversedArray objectAtIndex:0] intValue]*multiplyOfNegatives)) {
                NSLog(@"РАБОТАЕТ IF");
                answer = multiplyOfNegatives * [[reversedArray objectAtIndex:0] intValue];
                numberOfItems = numberOfItems-3;
                while (numberOfItems!=0) {
                    NSLog(@"ВАЙЛ РАБОТАЕТ");
                    int objectIndex =1;
                    answer = answer * [[reversedArray objectAtIndex:objectIndex] intValue];
                    objectIndex +=1;
                    numberOfItems -=1;
                }
            } else{
                for (int i=0; i<numberOfItems; i++) {
                  answer = answer * [[reversedArray objectAtIndex:i] intValue];
                }
                NSLog(@"ANSWER %d", answer);
            }
        NSLog(@"ANSWER %d", answer);
            
        } else {
            for (int i=0; i<numberOfItems; i++) {
                answer = answer * [[reversedArray objectAtIndex:i] intValue];
              }
              NSLog(@"ANSWER %d", answer);
        }

        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
