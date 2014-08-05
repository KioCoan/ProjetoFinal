//
//  Assunto.h
//  ProjetoFinal
//
//  Created by Kio Coan on 30/06/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import "Exercicio.h"

// #### Classe genérica seus herdeiros serão os assuntos tratados individualmente ######

@interface Assunto : NSObject

{
    int indiceExercicio;
    
}



@property NSString *nome, *teoria;
@property int paginas;
@property SKScene *animacao;
@property NSMutableArray *exercicios;
@property NSMutableArray *teoriaFormatada;

-(void)montaTeoria:(NSString*)nomeDoArquivo; // Usado somente em chamadas internas

-(void)selecionaExercicio:(int)index;

-(SKScene*)retornaExercicioSelecionado;

-(void)preparaExercicios;

-(NSMutableArray*)retornaTitulosEDescricoesExercicios;
-(int)getIndiceExercicio;
-(SKScene*)retornaAnimacaoNumero:(int)index;
@end
