//
//  DesafioOperadoresNode.h
//  ProjetoFinal
//
//  Created by RAFAEL APARECIDO DE FREITAS on 18/09/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "GerenciadorDesafios.h"
#import "Gerador.h"
#import "Desafio.h"


@interface DesafioOperadoresNode : SKNode

{
    SKLabelNode *parte1, *operador, *parte2, *resultado;
    SKNode *fundo, *btn1, *btn2;
    GerenciadorDesafios *gerenciadorDesafios;
    Desafio *desafioAtual;
    Gerador *gerador;
    
}


@end
