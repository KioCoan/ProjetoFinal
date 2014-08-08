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
        tipoCondicao = tipo;
        [self montaSprite:tipo];
        
        //[self texturaDeVerificando:YES];
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
    
    CGPoint posicao;
    
    if ([tipoCondicao isEqualToString:@"se"]) {
        posicao = CGPointMake(-15, 45);
    }else if ([tipoCondicao isEqualToString:@"senaoSe"]){
        posicao = CGPointMake(-15, -35);
    }else{
        posicao = CGPointMake(-15, -20);
    }

    
    
    [spriteExclamacao setPosition:posicao];
    [spriteExclamacao setSize:CGSizeMake(11, 43)];
}

-(void)mostraExclamacao:(BOOL)status{
    
    // Só adiciona exclamação caso o tipo seja diferente de "senao"
    if (![tipoCondicao isEqualToString:@"senao"]) {
        if (status) {
            [self addChild:spriteExclamacao];
        }else{
            [spriteExclamacao removeFromParent];
        }
    }
   

}
-(NSString*)getTipo{
    return tipoCondicao;
}

-(void)criarValores:(NSString*)valor1 eOperador:(NSString*)operador eValor2:(NSString*)valor2 resultado:(NSString*)resultado{
    
    spriteOperador = [[SpriteOperadorCondicional alloc] initWithValores:valor1 operador:operador valor2:valor2 resultado:resultado];
    
    spriteOperador.myDelegate = self;
    
    CGPoint posicao;
    
    if ([tipoCondicao isEqualToString:@"se"]) {
        posicao = CGPointMake(150, -20);
        [self addChild:spriteOperador];
    }else if ([tipoCondicao isEqualToString:@"senaoSe"]){
        posicao = CGPointMake(150, -100);
        [self addChild:spriteOperador];
    }else{
        posicao = CGPointMake(150, -20);
    }
    
    [spriteOperador setPosition:posicao];
    
}

-(void)verificacaoFinalizada{
    [self mostraExclamacao:NO];
}


-(void)verifica:(BOOL)status{
    
    [self texturaDeVerificando:status];
    [self mostraExclamacao:status];
    
}


-(void)texturaDeVerificando:(BOOL)status{
    SKTexture *textura;
    
    //VERIFICA
    if (status) {
        textura = [SKTexture textureWithImageNamed:[NSString stringWithFormat:@"%@-verde.png", tipoCondicao]];
        
    }else{
        textura = [SKTexture textureWithImageNamed:[NSString stringWithFormat:@"%@-normal.png", tipoCondicao]];
    }
    
    
    [self setTexture:textura];
}


-(void)iniciarTeste{
    [self mostraExclamacao:YES];
    [spriteOperador iniciarAnimacao];
}

-(NSString*)retornaTextoASerExibido{
    return [spriteOperador retornaTextoASerExibido];
}

-(BOOL)retornaVeracidade{
    return [spriteOperador retornaVeracidade];
}

@end
