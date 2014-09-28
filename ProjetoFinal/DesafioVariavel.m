//
//  DesafioVariavel.m
//  ProjetoFinal
//
//  Created by Felipe Costa Nascimento on 9/27/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "DesafioVariavel.h"

@implementation DesafioVariavel

-(id)initWithTempoDeResposta:(float)segundos{
    self = [super init];
    
    if(self){
        tempoDeResposta = segundos;
        [self setTituloDesafio:@"Desafio Variável"];
        [self setDescricaoDesafio:@"Toque na caixa que represente o tipo de dado visível na máquina."];
    }
    
    return self;
}

-(void)instanciaTarefas{
    
}

@end
