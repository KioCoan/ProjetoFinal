//
//  Desafio.m
//  ProjetoFinal
//
//  Created by Rafael Aparecido de Freitas on 15/09/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "Desafio.h"
#import "Expressao.h"
@implementation Desafio


-(id)initWithLevel:(int)level andType:(NSString *)type andTasks:(int)tasks{
    self = [super init];
    if (self) {
        listaTarefas = [[NSMutableArray alloc] init];
        nivel = level;
        tipo = type;
        nTasks = tasks;
        [self montaDesafio];
        tarefaAtual = 0;
    }
    return self;
}

-(void)montaDesafio{
    for (int i = 0; i<nTasks; i++) {
        [listaTarefas addObject:[[Expressao alloc] initWithNivel:nivel andOperator:tipo]];
    }
}

-(int)nTarefas{
    return nTasks;
}

-(NSString*)parte1{
    return [[listaTarefas objectAtIndex:tarefaAtual]saidaParte1];
}
-(NSString*)operador{
    return [[listaTarefas objectAtIndex:tarefaAtual]operador];
}
-(NSString*)parte2{
    return [[listaTarefas objectAtIndex:tarefaAtual]saidaParte2];
}
-(NSString*)resultado{
    return [[listaTarefas objectAtIndex:tarefaAtual]resultado];
}
-(BOOL)incrementaTarefa{
    tarefaAtual++;
    if (tarefaAtual >= nTasks) {
        return NO;
    }else{
        return YES;
    }
}
-(BOOL)decrementaTarefa{
    tarefaAtual--;
    if (tarefaAtual <= 0) {
        return NO;
    }else{
        return YES;
    }
}

@end
