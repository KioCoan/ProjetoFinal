//
//  AnimaVariavel.m
//  ProjetoFinal
//
//  Created by Felipe Costa Nascimento on 04/07/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "AnimaVariavel.h"

@implementation AnimaVariavel

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        enderecoCaixa = 1;
        spritesCaixa = [[NSMutableArray alloc] init];
        tamanhoCaixa = CGSizeMake(250, 300);
        
        //ADICIONA UMA CAIXA NO CANTO SUPERIOR ESQUERDO DA TELA
        CGPoint position = CGPointMake(tamanhoCaixa.width / 1.2, tamanhoCaixa.height * 1.6);
        [self criarNovaCaixaComConteudo:@"\"Hello World\"" nome:@"mensagem" tipo:@"String" posicao:position];
      
        //ADICIONA UMA CAIXA NO CANTO INFERIOR ESQUERDO DA TELA
        position = CGPointMake(tamanhoCaixa.width / 1.2, tamanhoCaixa.height / 1.7);
        [self runAction:[SKAction waitForDuration:0.8] completion:^{
            [self criarNovaCaixaComConteudo:@"148" nome:@"pessoas" tipo:@"inteiro" posicao:position];
        }];
        
        
        //ADICIONA UMA CAIXA NO CANTO SUPERIOR DIREITO DA TELA
        position = CGPointMake(tamanhoCaixa.width * 2.3, tamanhoCaixa.height * 1.6);
        [self runAction:[SKAction waitForDuration:0.4] completion:^{
            [self criarNovaCaixaComConteudo:@"259.90" nome:@"preco" tipo:@"real" posicao:position];
        }];
        
        //ADICIONA UMA CAIXA NO CANTO INFERIOR DIREITO DA TELA
        position = CGPointMake(tamanhoCaixa.width * 2.3, tamanhoCaixa.height / 1.7);
        [self runAction:[SKAction waitForDuration:1.2] completion:^{
            [self criarNovaCaixaComConteudo:@"verdadeiro" nome:@"luzAcesa" tipo:@"logico" posicao:position];
        }];
        
        

        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}



//METODO QUE RECEBE OS PARAMETROS NECESSARIOS PARA CRIAR UMA CAIXA E DEFINE O ENDEREÇO AUTOMATICAMENTE
-(void)criarNovaCaixaComConteudo:(NSString*)conteudo nome:(NSString*)nome tipo:(NSString*)tipo posicao:(CGPoint)posicao{
    
    SpriteCaixaNode *caixa = [[SpriteCaixaNode alloc] initWithConteudo:conteudo nome:nome tipo:tipo tamanho:tamanhoCaixa];
    [caixa setLabelEndereco:enderecoCaixa++];
    [caixa setMyDelegate:self];
    [caixa setPosition:posicao];
    [spritesCaixa addObject:caixa];
    [caixa iniciarAnimacaoIntroducao];
    
    [self addChild:caixa];
    
    
}


-(void)limparDelegatesMalditos{
    
    for(SpriteCaixaNode *node in spritesCaixa){
        [node setMyDelegate:nil];
        [node removeFromParent];
    }
    [spritesCaixa removeAllObjects];
}


-(void)spriteCaixaClicado:(SKSpriteNode *)spriteCaixa{
    SpriteCaixaNode *caixa = (SpriteCaixaNode*)spriteCaixa;
    
    [caixa executaSprite];
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
