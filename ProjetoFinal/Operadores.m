//
//  Operadores.m
//  ProjetoFinal
//
//  Created by Felipe Costa Nascimento on 08/07/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "Operadores.h"

@implementation Operadores

-(id)init{
    
    
    self = [super init];
    
    if (self) {
        [self setAnimacao:[[AnimaOperadores alloc] init]];
        [self montaTeoria:@"ConceitosOperadores"];
        [self setNome:@"Operadores"];
    }
    return self;
}

-(void)preparaExercicios{ // Aloca os objetos herdeiros, não instancia a cena dos exercícios
    // Instanciar vetor de exercicios e alocar exrcicios existentes
    self.exercicios = [[NSMutableArray alloc] init];
    [self.exercicios addObject:[[ExeOperadores1 alloc] init]];
    
    
}

@end
