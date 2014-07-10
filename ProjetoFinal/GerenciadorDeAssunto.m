//
//  GerenciadorDeAssunto.m
//  ProjetoFinal
//
//  Created by Kio Coan on 30/06/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "GerenciadorDeAssunto.h"
#import "Variavel.h"
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


-(void)mudarTemaEstudado{
    [self setAssunto:[[Variavel alloc]init]];
    
    
}
-(NSMutableArray*)retornaTeoriaFormatada{
    return [[self assunto]teoriaFormatada];
}


-(NSString*)getNomedoAssunto:(int)pos{
    return [nomesDosAssuntos objectAtIndex:pos];
}


//+(id)gerenciador{
//    @synchronized(self){
//        if (gerenciador == nil) {
//            gerenciador = [[self alloc]init];
//        }
//    }
//    return gerenciador;
//}
//
//+(void)mudarAssunto:(Assunto *)assunto{
//    @synchronized(self){
//        gerenciador.assunto = assunto;
//    }
//}

@end
