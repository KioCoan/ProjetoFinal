//
//  GerenciadorDeAssunto.h
//  ProjetoFinal
//
//  Created by Kio Coan on 30/06/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Assunto.h"

@interface GerenciadorDeAssunto : NSObject
{
    NSArray *nomesDosAssuntos;
    Assunto* assunto;
}


+ (GerenciadorDeAssunto *)sharedGerenciador;
+ (id)allocWithZone:(struct _NSZone *)zone;

-(void)mudarTemaEstudado:(NSString*)tema;
-(NSMutableArray*)retornaTeoriaFormatada;
-(NSString*)getNomedoAssunto:(int)pos;
-(NSString*)retornaNomeAssuntoAtual;
-(void)instanciaCenaDoExercicio:(int)index;
-(void)selecionaExercicio:(int)index;
-(SKScene*)retornaExercicioSelecionado;
-(void)preparaExercicios;
-(NSMutableArray*)retornaTitulosEDescricoesExercicios;
-(SKScene*)retornaAnimacao;
-(int)exercicioSelecionado;

-(SKScene*)retornaAnimacaoNumero:(int)index;

@end
