//
//  TipoCondicionalNode.h
//  ProjetoFinal
//
//  Created by Felipe Costa Nascimento on 05/08/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "SpriteTipoNode.h"

@interface SpriteCondicaoNode : SKSpriteNode
{
    SKSpriteNode *spriteExclamacao;
    NSString *tipoCondicao;
    SpriteTipoNode *spriteTipo;
    SKAction *animacaoPiscar;
}

-(id)initWithType:(NSString*)tipo;
-(void)mostraExclamacao:(BOOL)status;
-(NSString*)getTipo;
-(void)criarValores:(NSString*)valor1 eOperador:(NSString*)operador eValor2:(NSString*)valor2 resultado:(NSString*)resultado;



@end
