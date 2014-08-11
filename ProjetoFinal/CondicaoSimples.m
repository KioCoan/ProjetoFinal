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
        [self montaTeoria:@"ConceitosCondicionais"];
        [self setNome:@"Condição Simples"];
        self.cenaAtual = 0;
        
    }
    return self;
}


-(void)preparaExercicios{ // Aloca os objetos herdeiros, não instancia a cena dos exercícios
    
    
    
    self.exercicios = [[NSMutableArray alloc] init];
    [self.exercicios addObject:[[ExeCondSimples1 alloc] init]];
    
}

-(Animacao*)retornaAnimacaoNumero:(int)index{
    
    if (self.cenaAtual == index) {
        return nil;
    }
    
    switch (index) {
        case 1:
            [self setAnimacao:nil];
            [self setAnimacao:[[AnimaCondSimples alloc] initWithCondicao:@"SE"]];
            break;
            
        case 3:
            [self setAnimacao:nil];
            [self setAnimacao:[[AnimaCondSimples alloc] initWithCondicao:@"SE-SENAO"]];
            break;
            
        case 4:
            [self setAnimacao:nil];
            [self setAnimacao:[[AnimaCondSimples alloc] initWithCondicao:@"SE-SENAOSE"]];
            break;
            
        case 5:
            [self setAnimacao:nil];
            [self setAnimacao:[[AnimaCondSimples alloc] initWithCondicao:@"SE-SENAOSE-SENAO"]];
            break;
            
        default:
            [self setAnimacao:nil];
            break;
    }
    
    [self setCenaAtual:index];
    return [self animacao];
}



@end
