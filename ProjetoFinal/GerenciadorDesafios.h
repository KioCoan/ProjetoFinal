//
//  GerenciadorDesafios.h
//  ProjetoFinal
//
//  Created by RAFAEL APARECIDO DE FREITAS on 17/09/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Desafio.h"
@interface GerenciadorDesafios : NSObject

{
    NSMutableArray *meusDesafios;
    int desafioAtual;
}

+ (GerenciadorDesafios*)sharedGerenciador;
+ (id)allocWithZone:(struct _NSZone *)zone;

-(void)selecionaDesafio:(int)desafio;
-(NSMutableArray*)retornaDesafioSelacionado;
-(void)instanciaTarefas;
-(NSMutableArray*)retornaTitulosEDescricoesDesafios;
@end
