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

@interface Assunto : NSObject

@property NSString *nome, *teoria;
@property int paginas;
@property SKScene *animacao;
@property NSMutableArray *exercicios;
@property NSMutableArray *teoriaFormatada;

-(void)addExercicio:(Exercicio*)exercicio;

@end
