//
//  SpriteCondicaoNode.m
//  ProjetoFinal
//
//  Created by Felipe Costa Nascimento on 25/07/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "SpriteCondicaoNode.h"

static const int NUM_TEXTURAS = 14;

@implementation SpriteCondicaoNode

-(id)init{
    self = [super init];
    
    if(self){
        [self inicializarClasse];
    }
    
    return self;
}


-(void)inicializarClasse{
    [self setTexture:[SKTexture textureWithImageNamed:@"estrutura-condicionais1.png"]];
    [self setSize:CGSizeMake(227, 590)];
    
    [self inicializarFundosCondicoes];
}

-(void)inicializarFundosCondicoes{
    int numCondicoes = 2;
    CGPoint posicoes = CGPointMake(150, 170);
    
    for(int i=0; i<numCondicoes; i++){
        SKSpriteNode *fundoCondicao = [[SKSpriteNode alloc] initWithImageNamed:@"modo-condicao.png"];
        [fundoCondicao setSize:CGSizeMake(227, 159)];
        [fundoCondicao setPosition:posicoes];
        [self addChild:fundoCondicao];
        
        posicoes.y -= 210;
    }
    
}

-(void)criarCondicaoSe:(NSString*)valor1 operador:(NSString*)operador valor2:(NSString*)valor2{
    operadorSe = [[SpriteOperadorNode alloc] initWithValor1:valor1 operador:operador valor2:valor2 resultado:@""];
    [operadorSe ativarModoCondicao];
    [operadorSe setPosition:CGPointMake(150, 183)];
    [operadorSe iniciarAnimacaoAbrir];
    [self addChild:operadorSe];
}


-(void)criarCondicaoSenaoSe:(NSString*)valor1 operador:(NSString*)operador valor2:(NSString*)valor2{
    operadorSenaoSe = [[SpriteOperadorNode alloc] initWithValor1:valor1 operador:operador valor2:valor2 resultado:@""];
    [operadorSenaoSe ativarModoCondicao];
    [operadorSenaoSe setPosition:CGPointMake(150, -29)];
    [operadorSenaoSe iniciarAnimacaoAbrir];

    [self addChild:operadorSenaoSe];
}


-(void)iniciarAnimacao{
    NSMutableArray *texturas = [[NSMutableArray alloc] init];
    
    for(int i=1; i<=NUM_TEXTURAS; i++){
        [texturas addObject:[SKTexture textureWithImageNamed:[NSString stringWithFormat:@"estrutura-condicionais%d.png", i]]];
    }
    
    SKAction *animacao = [SKAction animateWithTextures:texturas timePerFrame:0.06];
    
    
    [self runAction:[SKAction waitForDuration:1] completion:^{
        [self runAction:animacao completion:^{
            [self removeAllActions];
        }];
    }];
}





@end
