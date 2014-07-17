//
//  GerenciadorDeAssunto.m
//  ProjetoFinal
//
//  Created by Kio Coan on 30/06/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "GerenciadorDeAssunto.h"
#import "Variavel.h"
#import "Operadores.h"
//static GerenciadorDeAssunto* gerenciador;

@implementation GerenciadorDeAssunto

-(id)init{
    self = [super init];
    
    if(self){
        nomesDosAssuntos = [NSArray arrayWithObjects:@"variavel",
                            @"operadores",
                            @"condicaoSimples",
                            @"condicaoComposta",
                            @"lacoFor",
                            @"lacoWhile",
                            @"lacoDoWhile",
                            @"vetor",
                            @"matriz",
                            @"funcaoSimples",
                            @"funcaoComParametro",
                            @"funcaoComRetorno", nil];
    }
    
    return self;
}


+ (GerenciadorDeAssunto *)sharedGerenciador{
    static GerenciadorDeAssunto *gerencidaorAssunto = nil;
    
    if (!gerencidaorAssunto) {
        gerencidaorAssunto = [[super allocWithZone:nil]init];
        
    }
    return gerencidaorAssunto;
}

+ (id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedGerenciador];
}


-(void)mudarTemaEstudado:(NSString*)tema{
    
    int index = -1;
    //varre o vetor em busca do tema passado como parametro
    for (int i = 0; i < nomesDosAssuntos.count; i++) {
        if ([tema isEqualToString:[nomesDosAssuntos objectAtIndex:i]]) {
            // ao achar o valor salva o indice na variavel index que será utilizada no switch logo abaixo
            index = i;
            break;
            
        }
    }
    
    switch (index) {
        case 0:
            [self setAssunto:nil];
            [self setAssunto:[[Variavel alloc]init]];
            break;
            
        default:
            [self setAssunto:nil];
            [self setAssunto:[[Operadores alloc]init]];
            break;
    }
    
    
    
    
    
}
-(NSMutableArray*)retornaTeoriaFormatada{
    return [[self assunto]teoriaFormatada];
}


-(NSString*)getNomedoAssunto:(int)pos{
    return [nomesDosAssuntos objectAtIndex:pos];
}


@end
