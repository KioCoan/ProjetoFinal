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
        textoASerExibido = resultado;
        [self inicializaSpriteValores:valor1 valor2:valor2];
        [self inicializaSpriteOperador:operador];
        [self verificaSeEVerdadeiro:valor1 eOperador:operador eValor2:valor2];
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
    [spriteResultado setLabelResultado:[NSString stringWithFormat:@"escreva (\"%@\")",resultado]];
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


-(void)iniciarAnimacao{
    NSArray *texturas = [NSArray arrayWithObjects:[SKTexture textureWithImageNamed:@"valor1-amarelo.png"], spriteValores.texture, nil];
    SKAction *piscaEsquerda = [SKAction animateWithTextures:texturas timePerFrame:0.3];
    
    texturas = [NSArray arrayWithObjects:[SKTexture textureWithImageNamed:@"valor2-amarelo.png"], spriteValores.texture, nil];
    SKAction *piscaDireita = [SKAction animateWithTextures:texturas timePerFrame:0.3];
    
    [spriteValores runAction:[SKAction repeatAction:piscaEsquerda count:4] completion:^{
        [spriteValores runAction:[SKAction repeatAction:piscaDireita count:4] completion:^{
            [spriteValores removeAllActions];

            if(verdadeiro){
                [spriteValores setTexture:[SKTexture textureWithImageNamed:@"valores-verdadeiro.png"]];
            }
        }];
    }];
}

-(void)verificaSeEVerdadeiro:(NSString*)valor1 eOperador:(NSString*)operador eValor2:(NSString*)valor2{
    Calculador *calculador = [[Calculador alloc] init];
    
    
    NSString *resultado = [calculador calculaOperador:operador numero1:valor1 numero2:valor2];
    
    if ([resultado isEqualToString:@"Verdadeiro"]) {
        verdadeiro = YES;
    }else{
        verdadeiro = NO;
    }
}

-(BOOL)retornaVeracidade{
    return verdadeiro;
}

-(NSString*)retornaTextoASerExibido{
    return textoASerExibido;
}
@end
