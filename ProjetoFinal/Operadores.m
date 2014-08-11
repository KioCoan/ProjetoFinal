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
        [self montaTeoria:@"ConceitosOperadores"];
        [self setNome:@"Operadores"];
        self.cenaAtual = 0;
    }
    return self;
}

-(void)preparaExercicios{ // Aloca os objetos herdeiros, não instancia a cena dos exercícios
    // Instanciar vetor de exercicios e alocar exrcicios existentes
    self.exercicios = [[NSMutableArray alloc] init];
    [self.exercicios addObject:[[ExeOperadores1 alloc] init]];
    
    
}

-(Animacao*)retornaAnimacaoNumero:(int)index{
    if (self.cenaAtual == index) {
        return nil;
    }
    
    switch (index) {
        case 1:
            [self setAnimacao:nil];
            [self setAnimacao:[[AnimaOperadores alloc] initWithOperador:@"ARITMÉTICO"]];
            break;
            
        case 3:
            [self setAnimacao:nil];
            [self setAnimacao:[[AnimaOperadores alloc] initWithOperador:@"ATRIBUIÇÃO"]];
            break;
        
        case 4:
            [self setAnimacao:nil];
            [self setAnimacao:[[AnimaOperadores alloc] initWithOperador:@"RELACIONAL"]];
            break;
            
        case 5:
            [self setAnimacao:nil];
            [self setAnimacao:[[AnimaOperadores alloc] initWithOperador:@"LÓGICO"]];
            break;
            
        default:
            [self setAnimacao:nil];
            break;
    }
    
    [self setCenaAtual:index];
    return [self animacao];
}


@end
