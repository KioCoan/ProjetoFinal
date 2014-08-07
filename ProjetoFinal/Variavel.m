//
//  Variavel.m
//  ProjetoFinal
//
//  Created by Rafael Aparecido de Freitas on 02/07/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "Variavel.h"
#import "AnimaOperadores.h"
@implementation Variavel
{
    int cenaAtual;
}

-(id)init{
    
    
    self = [super init];
    
    if (self) {
        [self setAnimacao:[[AnimaVariavel alloc] init]];
        [self montaTeoria:@"ConceitosVariaveis"];
        [self setNome:@"Variável"];
        cenaAtual = 0;
        
    }
    return self;
}


-(void)preparaExercicios{
    
    // Aloca os objetos de exercicios
    self.exercicios = [[NSMutableArray alloc] init];
    [self.exercicios addObject:[[ExeVariavel1 alloc] init]];
    [self.exercicios addObject:[[ExeVariavel2 alloc]init]];
}

-(SKScene*)retornaAnimacaoNumero:(int)index{
    
    if (cenaAtual == index) {
        return nil;
    }
    
    
    switch (index) {
        case 1:
            [self setAnimacao:nil];
            [self setAnimacao:[[AnimaVariavel alloc] init]];
            cenaAtual = index;
            break;
        case 3:
            [self setAnimacao:nil];
            [self setAnimacao:[[AnimaOperadores alloc] init]];
            cenaAtual = index;
            break;
   
        default:
            [self setAnimacao:nil];
            break;
    }
    return [self animacao];
}


@end
