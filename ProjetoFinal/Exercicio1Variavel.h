//
//  MyScene.h
//  Exercicio
//

//  Copyright (c) 2014 Henrique Pereira de Lima. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "SpriteCaixaNode.h"
#import "ConteudoDasCaixas.h"



@interface Exercicio1Variavel : SKScene <SKPhysicsContactDelegate>

@property BOOL movendoCaixa;
@property (nonatomic, strong) SKSpriteNode *selectedNode;

@end
