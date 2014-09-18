//
//  DesafioOperadoresNode.h
//  ProjetoFinal
//
//  Created by RAFAEL APARECIDO DE FREITAS on 18/09/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "GerenciadorDesafios.h"
#import "BotaoDesafiosNode.h"
#import "Gerador.h"
#import "Desafio.h"


@interface DesafioOperadoresNode : SKNode

{
    SKLabelNode *lblParte1, *lblOperador, *lblParte2, *lblResultado;
    BotaoDesafiosNode *btn1, *btn2;
    SKNode *fundo;
    
    
    GerenciadorDesafios *gerenciadorDesafios;
    Desafio *desafioAtual;
    Gerador *gerador;
    
}


@end
