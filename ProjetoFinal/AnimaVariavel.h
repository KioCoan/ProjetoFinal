//
//  AnimaVariavel.h
//  ProjetoFinal
//
//  Created by Felipe Costa Nascimento on 04/07/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//


#import <SpriteKit/SpriteKit.h>

@interface AnimaVariavel : SKScene

@property SKSpriteNode *caixa;
@property SKAction *animacaoAbrir;
@property SKAction *animacaoFechar;

@property BOOL movendoCaixa;
@property BOOL caixaAberta;
@end
