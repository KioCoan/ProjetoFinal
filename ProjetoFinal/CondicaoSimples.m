//
//  CondicaoSimples.m
//  ProjetoFinal
//
//  Created by Henrique Pereira de Lima on 21/07/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "CondicaoSimples.h"

@implementation CondicaoSimples

-(id)init{
    
    
    self = [super init];
    
    if (self) {
        [self setAnimacao:[[AnimaCondSimples alloc] init]];
        [self montaTeoria:@"ConceitosVariaveis"];
        [self setNome:@"Condição Simples"];
        
        
    }
    return self;
}


-(void)preparaExercicios{ // Aloca os objetos herdeiros, não instancia a cena dos exercícios
    
    
    
    self.exercicios = [[NSMutableArray alloc] init];
    [self.exercicios addObject:[[ExeCondSimples1 alloc] init]];
    
}




@end
