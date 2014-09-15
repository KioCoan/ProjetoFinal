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
        nivel = level;
        tipo = type;
        nTasks = tasks;
        [self montaDesafio];
    }
    return self;
}

-(void)montaDesafio{
    for (int i = 0; i<nTasks; i++) {
        [listaDesafios addObject:[[Expressao alloc] initWithNivel:nivel andOperator:tipo]];
    }
}

-(int)nTarefas{
    return nTasks;
}

@end
