//
// Created by Victor on 7/12/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "CandyBonusBase.h"


@interface CandyBonusColorBomb : CandyBonusBase

//properties

//designated initializer
- (CandyBonusBase *)initWithOwner:(Candy *)owner;

//methods

- (void)activateBonus;

@end