//
//  AnimaOperadores.m
//  ProjetoFinal
//
//  Created by Felipe Costa Nascimento on 08/07/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "AnimaOperadores.h"

@implementation AnimaOperadores

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        //ADICIONA UM OPERADOR NO CANTO SUPERIOR ESQUERDO DA TELA
        CGPoint position = CGPointMake(190, 400);
        [self criarOperador:@"350" operador:@"==" valor2:@"350" resultado:@"verdadeiro" posicao:position];
        
        //ADICIONA UM OPERADOR NO CANTO INFERIOR ESQUERDO DA TELA
        position = CGPointMake(190, 150);
        [self criarOperador:@"160" operador:@"+" valor2:@"200" resultado:@"360" posicao:position];
        
        //ADICIONA UM OPERADOR NO CANTO SUPERIOR DIREITO DA TELA
        position = CGPointMake(580, 400);
        [self criarOperador:@"verdadeiro" operador:@"&&" valor2:@"falso" resultado:@"falso" posicao:position];
        
        //ADICIONA UM OPERADOR NO CANTO INFERIOR DIREITO DA TELA
        position = CGPointMake(580, 150);
        [self criarOperador:@"100" operador:@"<" valor2:@"620" resultado:@"verdadeiro" posicao:position];
        
        
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}

-(void)criarOperador:(NSString*)valor1 operador:(NSString*)operador valor2:(NSString*)valor2 resultado:(NSString*)resultado posicao:(CGPoint)posicao{
    
    SpriteOperadorNode *spriteOperador = [[SpriteOperadorNode alloc] initWithValor1:valor1 operador:operador valor2:valor2 resultado:resultado];
    [spriteOperador setPosition:posicao];
    
    [self addChild:spriteOperador];
}

@end
