//
//  ResultadoCondicaoNode.m
//  ProjetoFinal
//
//  Created by Felipe Costa Nascimento on 26/07/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "ResultadoCondicaoNode.h"

@implementation ResultadoCondicaoNode

-(id)initWithVariavel:(NSString*)nome tipo:(NSString*)tipo conteudo:(NSString*)conteudo{
    self = [super init];
    
    if(self){
        [self setTexture:[SKTexture textureWithImageNamed:@"blocoDeCodigo.png"]];
        [self setSize:CGSizeMake(200, 250)];
        caixa = [[SpriteCaixaNode alloc] initWithConteudo:conteudo nome:nome tipo:tipo tamanho:CGSizeMake(159, 167)];
        [caixa setPosition:CGPointMake(0, -25)];
        [caixa abrirCaixa];
        [self addChild:caixa];
    }
    
    return self;
}



@end
