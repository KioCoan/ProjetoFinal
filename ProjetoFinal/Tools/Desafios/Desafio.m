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
        
        [self montaDesafioNivel:level tipo:type nTarefas:tasks];
    }
    return self;
}

-(id)init{
    self = [super init];
    if (self) {
        listaTarefas = [[NSMutableArray alloc] init];
    }
    return self;
}
-(void)montaDesafioNivel:(int)level tipo:(NSString*)type nTarefas:(int)nTarefas{
    nivel = level;
    tipo = type;
    nTasks = nTarefas;
    tarefaAtual = 0;
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
        tarefaAtual--;
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
-(NSMutableArray*)retornaTarefas{
    return listaTarefas;
}
-(void)instanciaTarefas{
    for (int i = 0; i<nTasks; i++) {
        [listaTarefas addObject:[[Expressao alloc] initWithNivel:nivel andOperator:tipo]];
    }
}
-(BOOL)respostaDupla{
    
    return [[listaTarefas objectAtIndex:tarefaAtual]respostaDupla];
}
@end
