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

@interface SpriteTipoNode : SKSpriteNode
{
    OperadorNode *spriteOperador;
    OperadorValoresNode *spriteValores;
    OperadorResultadoNode *spriteResultado;
}

-(id)initWithValores:(NSString*)valor1 operador:(NSString*)operador valor2:(NSString*)valor2;
@end
