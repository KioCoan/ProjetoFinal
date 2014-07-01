//
//  Assunto.h
//  ProjetoFinal
//
//  Created by Kio Coan on 30/06/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Animacao.h"
#import "Exercicio.h"

@interface Assunto : NSObject

@property NSString* nome, *teoria;
@property int paginas;
@property Animacao* animacao;
@property NSMutableArray* exercicios;

-(void)addExercicio:(Exercicio*)exercicio;

@end
