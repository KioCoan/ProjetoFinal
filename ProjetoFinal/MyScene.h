//
//  MyScene.h
//  DesafioVariavel
//

//  Copyright (c) 2014 Felipe Costa Nascimento. All rights reserved.
//

@import UIKit;

#import <SpriteKit/SpriteKit.h>
#import "SpriteVisorNode.h"
#import "SpriteEsteiraNode.h"
#import "SpriteCronometroNode.h"

@interface MyScene : SKScene <SpriteEsteiraDelegate, SpriteCronometroDelegate, SpriteVisorDelegate>
{
    SKSpriteNode *nodeFundo;
    
    SKSpriteNode *nodeMaquina;
    SpriteVisorNode *nodeVisor;
    SpriteEsteiraNode *nodeEsteira;
    SpriteCronometroNode *nodeCronometro;
}

@end
