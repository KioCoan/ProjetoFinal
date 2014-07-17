//
//  MyScene.h
//  Exercicio
//

//  Copyright (c) 2014 Henrique Pereira de Lima. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "SpriteCaixaNode.h"
#import "LabelConteudoCaixa.h"
#import "Exercicio.h"




@interface CenaExercicioVariavel1 : SKScene <SKPhysicsContactDelegate>
{
    NSMutableArray *caixas;
    NSMutableArray *conteudos;
    LabelConteudoCaixa *conteudoAtivo;
    NSArray *sprite;
    SKAction *executaSprite;
    NSArray *tipo;
    SKLabelNode *codigo;
}


@property BOOL movendoCaixa;


@end
