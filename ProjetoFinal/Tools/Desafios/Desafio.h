//
//  Desafio.h
//  ProjetoFinal
//
//  Created by Rafael Aparecido de Freitas on 15/09/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Desafio : NSObject

{
    int nTasks, nivel, tarefaAtual, nAcertos, nErros;
    NSMutableArray *listaTarefas;
    NSString *tipo;
}
@property NSString *tituloDesafio, *descricaoDesafio;


-(id)initWithLevel:(int)nivel andType:(NSString*)tipo andTasks:(int)tasks;
-(int)nTarefas;
-(NSString*)parte1;
-(NSString*)operador;
-(NSString*)parte2;
-(NSString*)resultado;
-(BOOL)incrementaTarefa;
-(BOOL)decrementaTarefa;
-(NSMutableArray*)retornaTarefas;
-(void)instanciaTarefas;
-(void)montaDesafioNivel:(int)level tipo:(NSString*)type nTarefas:(int)nTarefas;
@end
