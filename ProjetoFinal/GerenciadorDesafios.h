//
//  GerenciadorDesafios.h
//  ProjetoFinal
//
//  Created by RAFAEL APARECIDO DE FREITAS on 17/09/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Desafio.h"
extern NSString* const FONT_THIN;
extern NSString* const FONT_REGULAR;

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
-(Desafio*)retornaTarefasParaDesafio;
-(BOOL)corrige:(NSString*)opcao;
@end
