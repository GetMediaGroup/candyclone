//
// Created by Victor on 7/12/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "ECandyColor.h"

@class Candy;


@interface GameManager : NSObject
{

}

//properties

@property (nonatomic, readonly) NSMutableArray *candies;

//Designated initializer
- (GameManager *)init;

//methods

- (NSUInteger)getIndexOf:(Candy *)candy;

- (void)markCandyByIndex:(NSUInteger)index;

- (void)markColor:(enum ECandyColor)candyColor;

- (void)cleanup;

@end