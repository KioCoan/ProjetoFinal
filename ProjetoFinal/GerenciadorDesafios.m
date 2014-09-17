//
//  GerenciadorDesafios.m
//  ProjetoFinal
//
//  Created by RAFAEL APARECIDO DE FREITAS on 17/09/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "GerenciadorDesafios.h"

@implementation GerenciadorDesafios


+ (GerenciadorDesafios*)sharedGerenciador{
    static GerenciadorDesafios *gerencidaorDesafios = nil;
    
    if (!gerencidaorDesafios) {
        gerencidaorDesafios = [[super allocWithZone:nil]init];
        
    }
    return gerencidaorDesafios;
}

+ (id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedGerenciador];
}

-(id)init{
    self = [super init];
    if (self) {
        meusDesafios = [[NSMutableArray alloc] init];
        [self criaDesafios];
    }
    return self;
}

-(void)criaDesafios{
    
    
    [meusDesafios addObject:[self retornaDesafioNivel:1 tipo:@"logico" nTarefas:10]]; // DESAFIO 1 - ALTERAR TITULO E DESCRIÇÃO NO MÉTODO DE RETORNO
    [meusDesafios addObject:[self retornaDesafioNivel:1 tipo:@"relacional" nTarefas:10]]; // DESAFIO 2 - ALTERAR TITULO E DESCRIÇÃO NO MÉTODO DE RETORNO
    [meusDesafios addObject:[self retornaDesafioNivel:2 tipo:@"logico" nTarefas:15]]; // DESAFIO 3 - ALTERAR TITULO E DESCRIÇÃO NO MÉTODO DE RETORNO
    
    
}


-(Desafio*)retornaDesafioNivel:(int)level tipo:(NSString*)type nTarefas:(int)nTarefas{
    
    Desafio *d = [[Desafio alloc] initWithLevel:level andType:type andTasks:nTarefas];
    switch (meusDesafios.count+1) {
        case 1:
            [d setTituloDesafio:@"Desafio 1"];
            [d setDescricaoDesafio:@"Resolva 10 exercícios de operadores lógicos"];
            break;
        case 2:
            [d setTituloDesafio:@"Desafio 2"];
            [d setDescricaoDesafio:@"Resolva 10 exercícios de operadores relacionais"];
            break;
        case 3:
            [d setTituloDesafio:@"Desafio 3"];
            [d setDescricaoDesafio:@"Resolva 15 exercícios de operadores relacionais"];
            break;
        default:
            break;
    }
    
    return d;
}

-(void)selecionaDesafio:(int)desafio{
    desafioAtual = desafio;
}
-(NSMutableArray*)retornaDesafioSelacionado{
    return [[meusDesafios objectAtIndex:desafioAtual] retornaTarefas];
}

-(void)instanciaTarefas{
    [[meusDesafios objectAtIndex:desafioAtual] instanciaTarefas];
}

-(NSMutableArray*)retornaTitulosEDescricoesDesafios{ //retorna a descrição e os títulos dos exercícios
    
    
    NSMutableArray *titulosEDescricoes = [[NSMutableArray alloc] init];
    
    for (int i = 0; i< meusDesafios.count;i++) {
        
        //Cria um Dicioario com o título e a descrição do exercício e depois adiciona no Vetor
        
        NSDictionary *dict = @{@"titulo": [[meusDesafios objectAtIndex:i] tituloDesafio],
                               @"descricao":[[meusDesafios objectAtIndex:i] descricaoDesafio],
                               @"desafio":[meusDesafios objectAtIndex:i]
                               };
        [titulosEDescricoes addObject:dict];
    }
    return titulosEDescricoes;
}

@end
