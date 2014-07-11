//
//  SpriteCaixaself.m
//  testeSprite
//
//  Created by Felipe Costa Nascimento on 11/07/14.
//  Copyright (c) 2014 Felipe Costa Nascimento. All rights reserved.
//

#import "SpriteCaixaNode.h"

@implementation SpriteCaixaNode

-(id)init{
    self = [super init];
    
    if(self){
        [self setTexture:[SKTexture textureWithImageNamed:@"abrir-caixa1.png"]];
        [self setSize:CGSizeMake(307, 328)];
        [self inicializaLabels];
        [self inicializaAnimacaoAbrirCaixa];
        [self inicializaAnimacaoFecharCaixa];
    }
    
    return self;
}

-(id)initWithConteudo:(NSString*)conteudo Nome:(NSString*)nome Tipo:(NSString*)tipo{
    self = [super init];
    
    if(self){
        [self setTexture:[SKTexture textureWithImageNamed:@"abrir-caixa1.png"]];
        [self setSize:CGSizeMake(307, 328)];
        
        [self inicializaLabels];
        [self setLabelConteudo:conteudo];
        [self setLabelNome:nome];
        [self setLabelTipo:tipo];
        
        [self inicializaAnimacaoAbrirCaixa];
        [self inicializaAnimacaoFecharCaixa];
    }
    
    return self;
}

-(void)inicializaLabels{
    lblConteudo = [[SKLabelNode alloc] init];
    [lblConteudo setText:@"Insira um conteúdo"];
    [lblConteudo setFontSize:18];
    [lblConteudo setFontColor:[SKColor grayColor]];
    [lblConteudo setPosition:CGPointMake(50, 70)];
    [lblConteudo setHidden:YES];
    
    lblNome = [[SKLabelNode alloc] init];
    [lblNome setText:@"Insira um nome"];
    [lblNome setFontSize:18];
    [lblNome setFontColor:[SKColor grayColor]];
    [lblNome setPosition:CGPointMake(-50, -25)];
    
    lblTipo = [[SKLabelNode alloc] init];
    [lblTipo setText:@"Insira um tipo"];
    [lblTipo setFontSize:18];
    [lblTipo setFontColor:[SKColor grayColor]];
    [lblTipo setPosition:CGPointMake(-60, -95)];
    
    [self addChild:lblConteudo];
    [self addChild:lblNome];
    [self addChild:lblTipo];
}

-(void)setLabelConteudo:(NSString*)text{
    [lblConteudo setText: text];
}

-(void)setLabelNome:(NSString*)text{
    [lblNome setText: text];
}

-(void)setLabelTipo:(NSString*)text{
    [lblTipo setText: text];
}



-(void)animacaoAbrirOuFechar{
    if(caixaAberta){
        [lblConteudo setHidden:YES];
        [self runAction:animacaoFechar completion:^{
            [self removeAllActions];
            caixaAberta = NO;
            
        }];
        
        
    }else{
        [self runAction:animacaoAbrir completion:^{
            [self removeAllActions];
            caixaAberta = YES;
            [lblConteudo setHidden:NO];
        }];
    }

}


-(void)inicializaAnimacaoAbrirCaixa{
    //CRIO TEXTURAS PARA TODAS OS SPRITES DA VARIAVEL
    SKTexture *caixa1 = [SKTexture textureWithImageNamed:@"abrir-caixa1.png"];
    SKTexture *caixa2 = [SKTexture textureWithImageNamed:@"abrir-caixa2.png"];
    SKTexture *caixa3 = [SKTexture textureWithImageNamed:@"abrir-caixa3.png"];
    SKTexture *caixa4 = [SKTexture textureWithImageNamed:@"abrir-caixa4.png"];
    SKTexture *caixa5 = [SKTexture textureWithImageNamed:@"abrir-caixa5.png"];
    SKTexture *caixa6 = [SKTexture textureWithImageNamed:@"abrir-caixa6.png"];
    SKTexture *caixa7 = [SKTexture textureWithImageNamed:@"abrir-caixa7.png"];
    SKTexture *caixa8 = [SKTexture textureWithImageNamed:@"abrir-caixa8.png"];
    SKTexture *caixa9 = [SKTexture textureWithImageNamed:@"abrir-caixa9.png"];
    SKTexture *caixa10 = [SKTexture textureWithImageNamed:@"abrir-caixa10.png"];
    SKTexture *caixa11 = [SKTexture textureWithImageNamed:@"abrir-caixa11.png"];
    SKTexture *caixa12 = [SKTexture textureWithImageNamed:@"abrir-caixa12.png"];
    SKTexture *caixa13 = [SKTexture textureWithImageNamed:@"abrir-caixa13.png"];
    
    NSArray *array = [NSArray arrayWithObjects:caixa1, caixa2, caixa3, caixa4, caixa5, caixa6, caixa7, caixa8, caixa9, caixa10, caixa11, caixa12, caixa13, nil];
    
    //INSTANCIO A SKACTION COM O ARRAY DE TEXTURAS CRIADO
    animacaoAbrir = [SKAction animateWithTextures:array timePerFrame:0.05];
}

-(void)inicializaAnimacaoFecharCaixa{
    //CRIO TEXTURAS PARA TODAS OS SPRITES DA VARIAVEL EM ORDEM INVERSA (CAIXA FECHANDO)
    SKTexture *caixa1 = [SKTexture textureWithImageNamed:@"abrir-caixa13.png"];
    SKTexture *caixa2 = [SKTexture textureWithImageNamed:@"abrir-caixa12.png"];
    SKTexture *caixa3 = [SKTexture textureWithImageNamed:@"abrir-caixa11.png"];
    SKTexture *caixa4 = [SKTexture textureWithImageNamed:@"abrir-caixa10.png"];
    SKTexture *caixa5 = [SKTexture textureWithImageNamed:@"abrir-caixa9.png"];
    SKTexture *caixa6 = [SKTexture textureWithImageNamed:@"abrir-caixa8.png"];
    SKTexture *caixa7 = [SKTexture textureWithImageNamed:@"abrir-caixa7.png"];
    SKTexture *caixa8 = [SKTexture textureWithImageNamed:@"abrir-caixa6.png"];
    SKTexture *caixa9 = [SKTexture textureWithImageNamed:@"abrir-caixa5.png"];
    SKTexture *caixa10 = [SKTexture textureWithImageNamed:@"abrir-caixa4.png"];
    SKTexture *caixa11 = [SKTexture textureWithImageNamed:@"abrir-caixa3.png"];
    SKTexture *caixa12 = [SKTexture textureWithImageNamed:@"abrir-caixa2.png"];
    SKTexture *caixa13 = [SKTexture textureWithImageNamed:@"abrir-caixa1.png"];
    
    NSArray *array = [NSArray arrayWithObjects:caixa1, caixa2, caixa3, caixa4, caixa5, caixa6, caixa7, caixa8, caixa9, caixa10, caixa11, caixa12, caixa13, nil];
    
    //INSTANCIO A SKACTION COM O ARRAY DE TEXTURAS CRIADO
    animacaoFechar = [SKAction animateWithTextures:array timePerFrame:0.05];
}


@end
