//
//  TipoCondicionalNode.h
//  ProjetoFinal
//
//  Created by Felipe Costa Nascimento on 05/08/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "SpriteOperadorCondicional.h"
#import "Calculador.h"

@interface SpriteCondicaoNode : SKSpriteNode
{
    SKSpriteNode *spriteExclamacao;
    NSString *tipoCondicao;
    SpriteOperadorCondicional *spriteOperador;
    SKAction *animacaoPiscar;
}
@property BOOL verdadeiro;

-(id)initWithType:(NSString*)tipo;
-(void)mostraExclamacao:(BOOL)status;
-(NSString*)getTipo;
-(void)criarValores:(NSString*)valor1 eOperador:(NSString*)operador eValor2:(NSString*)valor2 resultado:(NSString*)resultado;
-(void)iniciarTeste;
-(NSString*)retornaTextoASerExibido;
-(BOOL)retornaVeracidade;

@end
