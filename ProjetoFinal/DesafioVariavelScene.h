//
//  MyScene.h
//  DesafioVariavel
//

//  Copyright (c) 2014 Felipe Costa Nascimento. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "DesafioVariavel.h"
#import "SpriteVisorNode.h"
#import "SpriteEsteiraNode.h"
#import "SpriteCronometroNode.h"
#import "ProgressoDesafioBar.h"

@interface DesafioVariavelScene : SKScene <SpriteEsteiraDelegate, SpriteCronometroDelegate, SpriteVisorDelegate>
{
    SKSpriteNode *nodeFundo;
    
    SKSpriteNode *nodeMaquina;
    SpriteVisorNode *nodeVisor;
    SpriteEsteiraNode *nodeEsteira;
    SpriteCronometroNode *nodeCronometro;
    ProgressoDesafioBar *progresso;
}

@end
