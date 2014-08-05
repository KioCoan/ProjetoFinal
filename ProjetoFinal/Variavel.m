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


-(void)preparaExercicios{
    
    // Aloca os objetos de exercicios
    self.exercicios = [[NSMutableArray alloc] init];
    [self.exercicios addObject:[[ExeVariavel1 alloc] init]];
}

-(SKScene*)retornaAnimacaoNumero:(int)index{
    
    
    switch (index) {
        case 1:
            [self setAnimacao:nil];
            [self setAnimacao:[[AnimaVariavel alloc] init]];
            break;
            
        default:
            [self setAnimacao:nil];
            break;
    }
    return [self animacao];
}


@end
