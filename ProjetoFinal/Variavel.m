//
//  Variavel.m
//  ProjetoFinal
//
//  Created by Rafael Aparecido de Freitas on 02/07/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "Variavel.h"

@implementation Variavel


-(id)init{
    
    
    self = [super init];
    
    if (self) {
        [self setAnimacao:[[AnimaVariavel alloc] init]];
        [self montaTeoria:@"ConceitosVariaveis"];
        [self setNome:@"Variável"];
        
        
    }
    return self;
}


-(void)preparaExercicios{ // Aloca os objetos herdeiros, não instancia a cena dos exercícios
   
    
    
    self.exercicios = [[NSMutableArray alloc] init];
    [self.exercicios addObject:[[ExeVariavel1 alloc] init]];
    
}



@end
