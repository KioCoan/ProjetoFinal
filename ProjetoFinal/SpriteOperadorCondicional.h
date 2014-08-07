//
//  SpriteTipoNode.h
//  ProjetoFinal
//
//  Created by RAFAEL APARECIDO DE FREITAS on 06/08/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "OperadorNode.h"
#import "OperadorValoresNode.h"
#import "OperadorResultadoNode.h"
#import "Calculador.h"

@interface SpriteOperadorCondicional : SKSpriteNode
{
    OperadorNode *spriteOperador;
    OperadorValoresNode *spriteValores;
    OperadorResultadoNode *spriteResultado;
    BOOL verdadeiro;
    NSString* textoASerExibido;
}

-(id)initWithValores:(NSString*)valor1 operador:(NSString*)operador valor2:(NSString*)valor2 resultado:(NSString*)resultado;
-(void)iniciarAnimacao;
-(BOOL)retornaVeracidade;
-(NSString*)retornaTextoASerExibido;
@end
