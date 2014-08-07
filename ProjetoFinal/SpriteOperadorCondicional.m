//
//  SpriteTipoNode.m
//  ProjetoFinal
//
//  Created by RAFAEL APARECIDO DE FREITAS on 06/08/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "SpriteOperadorCondicional.h"

@implementation SpriteOperadorCondicional


-(id)initWithValores:(NSString*)valor1 operador:(NSString*)operador valor2:(NSString*)valor2 resultado:(NSString*)resultado{
    self = [super init];
    
    if(self){
        [self inicializaSpriteResultado:resultado];
        [self inicializaSpriteValores:valor1 valor2:valor2];
        [self inicializaSpriteOperador:operador];
        
        
    }
    
    return self;
}

//CRIAR O SPRITE ONDE EXIBE O BLOCO DE TEXTO CASO A CONDIÇAO SEJA VERDADEIRA
-(void)inicializaSpriteResultado:(NSString*)resultado{
    spriteResultado = [[OperadorResultadoNode alloc] initWithResultado:resultado];
    [spriteResultado setTexture:[SKTexture textureWithImageNamed:@"parte-resultado.png"]];
    [spriteResultado  setPosition:CGPointMake(0, -40)];
    [spriteResultado setSize:CGSizeMake(227, 159)];
    [spriteResultado iniciarAnimacao];
    [spriteResultado setLabelResultado:resultado];
    [[spriteResultado lblResultado] setFontSize:20];
    [[spriteResultado lblResultado] setFontColor:[SKColor blackColor]];

    [self addChild:spriteResultado];
}


//CRIA O SPRITE QUE EXIBE OS VALORES QUE SERAM VERIFICADOS NA CONDIÇÃO
-(void)inicializaSpriteValores:(NSString*)valor1 valor2:(NSString*)valor2{
    spriteValores = [[OperadorValoresNode alloc] initWithValor1:valor1 valor2:valor2];
    [spriteValores setTexture:[SKTexture textureWithImageNamed:@"parte-valores1.png"]];
//    [spriteValores runAction:[spriteValores getAnimacaoExpandir]];
    [spriteValores iniciarAnimacao];
    [spriteResultado addChild:spriteValores];
}


//CRIA O SPRITE QUE MOSTRA O OPERADOR DOS VALORES
-(void)inicializaSpriteOperador:(NSString*)operador{
    spriteOperador = [[OperadorNode alloc] initWithOperador:operador];
    
    [spriteValores addChild:spriteOperador];
}


@end
