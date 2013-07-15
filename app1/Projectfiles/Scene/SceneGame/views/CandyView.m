//
// Created by Vladislav Babkin on 7/14/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "CandyView.h"
#import "Candy.h"
#import "CCButton.h"
#import "ResourceManager.h"
#import "SceneGame.h"
#import "CCSprite+Resize.h"
#import "MyConstants.h"
#import "GameManager.h"


@implementation CandyView
{
    SceneGame* _scene;
    CCSprite* _selector;
}
- (CandyView*)initWithCandy:(Candy *)candy scene:(SceneGame*)scene
{
    self = [super init];
    if(self)
    {
        _representsCandy = candy;
        _scene = scene;
        _selector = [CCSprite spriteWithFile:[ResourceManager getCandySelector]];

        NSMutableArray* images = [ResourceManager getCandyImage:candy.color type:candy.bonus.type];
        _button = [[CCButton alloc] initWithCCSprite:_selector];
        _button.delegate = self;

        for(NSUInteger i = 0; i<[images count]; i++)
        {
            [_button addCCSprite:[CCSprite spriteWithFile:[images objectAtIndex:i]]];

        }
        [_button addCCSprite:_selector];
        _selector.opacity = 0;
    }
    return self;

}

-(void)deactivate
{
    _selector.opacity = 0;
}

- (void)activateBonus
{
    switch (_representsCandy.bonus.type)
    {
        case ECBT_NOTHING:
        {
            CCScaleTo * a1 = [CCScaleTo actionWithDuration:BONUS_ANIMATION_TIME scale:0.05];
            [_button runAction:a1];
            break;
        }
        default:
        {
            NSLog(@"TODO: animations for bonuses");
        }
    }
    [_scene performSelector:@selector(removeChild:) withObject:self.button afterDelay:BONUS_ANIMATION_TIME];
    [self cleanup];


}

- (void)cleanup
{
    _button = nil;
    _representsCandy = nil;
    _scene = nil;
}

/*
 * ButtonDelegate
 */

- (void)didButtonTouchBegan:(CCButton *)button touch:(UITouch *)touch
{

}

- (void)didButtonTouchMoved:(CCButton *)button touch:(UITouch *)touch
{

}

- (void)didButtonTouchEnded:(CCButton *)button touch:(UITouch *)touch
{
    if(!_scene.gameManager.animationIsRunning)
        [_scene select:self];
}

- (void)didButtonTouchCanceled:(CCButton *)button touch:(UITouch *)touch
{

}

-(void)activate
{
    _selector.opacity = 255;
}

@end