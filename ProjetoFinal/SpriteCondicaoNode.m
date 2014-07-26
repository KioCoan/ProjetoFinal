//
//  SpriteCondicaoNode.m
//  ProjetoFinal
//
//  Created by Felipe Costa Nascimento on 25/07/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "SpriteCondicaoNode.h"

const int SE_SENAO = 1;
const int SE_SENAOSE_SENAO = 2;

@implementation SpriteCondicaoNode

-(id)initWithTipoDeCondicao:(int)tipo{
    self = [super init];
    
    if(self){
        [self inicializarClasse:tipo];
    }
    
    return self;
}


-(void)inicializarClasse:(int)tipo{
    blocosDeCodigo = [[NSMutableArray alloc] init];
    
    switch (tipo) {
        case SE_SENAO:
            [self classeComSeSenao];
            break;
            
        case SE_SENAOSE_SENAO:
            [self classeComSeSenaoSeSenao];
            break;
            
        default:
            break;
    }
}

-(void)classeComSeSenao{
    //A PARTE QUE É EXIBIDO O RESULTADO É A PRIMEIRA A SER INSERIDA PRA QUE ELA FIQUE POR TRÁS DAS OUTRAS
    [self criarBlocoDeCodigo:@"resultado" :@"string" :@"\"Aprovado\"" :CGPointMake(-120, -100)];
    [self criarBlocoDeCodigo:@"resultado" :@"string" :@"\"Reprovado\"" :CGPointMake(120, -100)];
    
    //EM SEGUIDA É INSERIDO A PARTE QUE MOSTRA OS VALORES
    nodeValores = [[OperadorValoresNode alloc] initWithValor1:@"media" valor2:@"6"];
    [nodeValores setPosition:CGPointMake(0, 10)];
    [nodeValores runAction:[nodeValores getAnimacaoExpandir]];
    [nodeValores iniciarAnimacao];
    [self addChild:nodeValores];
    
    
    //POR FIM É INSERIDO A PARTE QUE MOSTRA O OPERADOR
    nodeOperador = [[OperadorNode alloc] initWithOperador:@">"];
    [nodeValores addChild:nodeOperador];
}

-(void)classeComSeSenaoSeSenao{
    
}


-(void)criarBlocoDeCodigo:(NSString*)nome :(NSString*)tipo :(NSString*)conteudo :(CGPoint)posicao{
    ResultadoCondicaoNode *resultado1 = [[ResultadoCondicaoNode alloc] initWithVariavel:nome tipo:tipo conteudo:conteudo];
    [resultado1 setPosition:posicao];
    
    [blocosDeCodigo addObject:resultado1];
    [self addChild:resultado1];
}

@end
