//
//  SpriteCondicaoNode.h
//  ProjetoFinal
//
//  Created by Felipe Costa Nascimento on 25/07/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "OperadorNode.h"
#import "OperadorValoresNode.h"
#import "ResultadoCondicaoNode.h"

extern int const SE_SENAO;
extern int const SE_SENAOSE_SENAO;

@interface SpriteCondicaoNode : SKSpriteNode
{
    OperadorNode *nodeOperador;
    OperadorValoresNode *nodeValores;
    NSMutableArray *blocosDeCodigo;
}


-(id)initWithTipoDeCondicao:(int)tipo;
@end
