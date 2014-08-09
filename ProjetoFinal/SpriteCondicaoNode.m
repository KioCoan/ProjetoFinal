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
        
    }
    return self;
}

-(void)montaSprite:(NSString*)tipo{
    CGSize tamanho;
    
    if ([tipo isEqualToString:@"se"]) {
        tamanho = CGSizeMake(135, 102);
        [self criaSpriteExclamacao];
    }else if ([tipo isEqualToString:@"senaoSe"]){
        tamanho = CGSizeMake(135, 259);
        [self criaSpriteExclamacao];
    }else{
        tamanho = CGSizeMake(227, 282);
    }
    
    
    [self setTexture:[self getTexturaDoTipo:@"normal"]];
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

//ESTE METODO RETORNA UMA TEXTURA COM BASE DO TIPO DE CONDIÇAO DESTA CLASSE E TIPO DE TEXTURA (NORMAL OU VERDE)
-(SKTexture*)getTexturaDoTipo:(NSString*)tipoTextura{
    return [SKTexture textureWithImageNamed:[NSString stringWithFormat:@"%@-%@.png", tipoCondicao, tipoTextura]];
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
    [spriteOperador ajustarTamanho:self.size.width];
    spriteOperador.myDelegate = self;
    
    CGPoint posicao;
    
    if ([tipoCondicao isEqualToString:@"se"]) {
        posicao = CGPointMake(150, -20);
        [self addChild:spriteOperador];
    }else if ([tipoCondicao isEqualToString:@"senaoSe"]){
        posicao = CGPointMake(150, -100);
        [self addChild:spriteOperador];
    }else{
        [self criarLabelResultado:resultado];
    }
    
    [spriteOperador setPosition:posicao];
    
}

-(void)criarLabelResultado:(NSString*)resultado{
    SKLabelNode *lblResultado = [SKLabelNode labelNodeWithFontNamed:@"Avenir Next Condensed Medium"];
    [lblResultado setText:[NSString stringWithFormat:@"escreva (\"%@\")",resultado]];
    [lblResultado setFontSize:20];
    [lblResultado setFontColor:[SKColor blackColor]];
    [lblResultado setPosition:CGPointMake(0, -30)];
    
    [self addChild:lblResultado];
}


-(void)resetarTextura{
    [spriteOperador resetarTextura];
}


-(void)iniciarTeste{
    //ANTES DE INICIAR O TESTE É VERIFICADO SE A CONDIÇÃO É UM SENÃO, CASO SEJA A TEXTURA, E MODIFICADA E FIM DE MÉTODO
    if([tipoCondicao isEqualToString:@"senao"]){
        [self setTexture:[self getTexturaDoTipo:@"verde"]];
        [[self myDelegate] testeFinalizado:YES];
        return;
    }
    
    
    [self mostraExclamacao:YES];
    
    //APÓS EXIBIR O NODE EXCLAMAÇÃO É INICIADA UMA ANIMAÇÃO DE ESPERA ANTES DE SER INICIADA A ANIMAÇÃO QUE TESTA A CONDIÇÃO
    [spriteOperador runAction:[SKAction waitForDuration:0.5] completion:^{
        [spriteOperador removeAllActions];
        [spriteOperador iniciarAnimacao];
    }];
}

-(NSString*)retornaTextoASerExibido{
    return [spriteOperador retornaTextoASerExibido];
}

-(BOOL)retornaVeracidade{
    return [spriteOperador retornaVeracidade];
}


-(void)testeFinalizado{
    [self mostraExclamacao:NO];
    [[self myDelegate] testeFinalizado:[spriteOperador retornaVeracidade]];
}

@end
