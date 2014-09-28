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
-(UIColor*)retornaMinhaCor{
    UIColor *minhaCor;
    if (desafioConcluido) {
        minhaCor = [UIColor colorWithRed:201/255 green:195/255 blue:191/255 alpha:1];
    }else{
        minhaCor = [UIColor colorWithRed:76/255 green:160/255 blue:164/255 alpha:1];
    }
    return minhaCor;
}

@end
