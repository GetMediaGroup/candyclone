//
// Created by Victor on 7/12/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "CandyBonusBase.h"


@interface CandyBonusNothing : CandyBonusBase

//properties
@property(nonatomic, readonly) ECandyBonusType type;

//designated initializer
- (id)initWithOwner:(Candy *)owner;

@end