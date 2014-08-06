//
//  TipoCondicionalNode.m
//  ProjetoFinal
//
//  Created by Felipe Costa Nascimento on 05/08/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "SpriteCondicaoNode.h"

@implementation SpriteCondicaoNode

-(id)initWithType:(NSString*)tipo{
    self = [super init];
    if (self) {
        meuTipo = tipo;
        [self montaSprite:tipo];
    }
    return self;
}

-(void)montaSprite:(NSString*)tipo{
    
    SKTexture *textura;
    CGSize tamanho;
    
    if ([tipo isEqualToString:@"se"]) {
        textura =  [SKTexture textureWithImageNamed:@"se-normal.png"];
        tamanho = CGSizeMake(135, 102);
        [self criaSpriteExclamacao];
    }else if ([tipo isEqualToString:@"senaoSe"]){
        textura =  [SKTexture textureWithImageNamed:@"senaoSe-normal.png"];
        tamanho = CGSizeMake(135, 259);
        [self criaSpriteExclamacao];
    }else{
        textura =  [SKTexture textureWithImageNamed:@"senao-normal.png"];
        tamanho = CGSizeMake(227, 282);
    }
    [self setTexture:textura];
    [self setSize:tamanho];
}

-(void)criaSpriteExclamacao{
    spriteExclamacao = [SKSpriteNode spriteNodeWithImageNamed:@"sprite-exclamacao.png"];
    [spriteExclamacao setPosition:CGPointMake(0, 15)];
    [spriteExclamacao setSize:CGSizeMake(11, 43)];
}

-(void)mostraExclamacao:(BOOL)status{
    if (status) {
        [self addChild:spriteExclamacao];
    }else{
        [spriteExclamacao removeFromParent];
    }
}
-(NSString*)getTipo{
    return meuTipo;
}

-(void)criarValores:(NSString*)valor1 eOperador:(NSString*)operador eValor2:(NSString*)valor2{
    
}

@end
