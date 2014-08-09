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
        tamanhoCaixa = CGSizeMake(250, 267);
        
        //ADICIONA UMA CAIXA NO CANTO SUPERIOR ESQUERDO DA TELA
        CGPoint position = CGPointMake(tamanhoCaixa.width / 1.2, tamanhoCaixa.height * 1.7);
        [self criarNovaCaixaComConteudo:@"\"Hello World\"" nome:@"mensagem" tipo:@"String" posicao:position];
      
        //ADICIONA UMA CAIXA NO CANTO INFERIOR ESQUERDO DA TELA
        position = CGPointMake(tamanhoCaixa.width / 1.2, tamanhoCaixa.height / 2);
        [self criarNovaCaixaComConteudo:@"148" nome:@"pessoas" tipo:@"inteiro" posicao:position];
        
        //ADICIONA UMA CAIXA NO CANTO SUPERIOR DIREITO DA TELA
        position = CGPointMake(tamanhoCaixa.width * 2.3, tamanhoCaixa.height * 1.7);
        [self criarNovaCaixaComConteudo:@"259.90" nome:@"preco" tipo:@"real" posicao:position];
        
        //ADICIONA UMA CAIXA NO CANTO INFERIOR DIREITO DA TELA
        position = CGPointMake(tamanhoCaixa.width * 2.3, tamanhoCaixa.height / 2);
        [self criarNovaCaixaComConteudo:@"verdadeiro" nome:@"luzAcesa" tipo:@"logico" posicao:position];
        

        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}

//METODO QUE RECEBE OS PARAMETROS NECESSARIOS PARA CRIAR UMA CAIXA E DEFINE O ENDEREÇO AUTOMATICAMENTE
-(void)criarNovaCaixaComConteudo:(NSString*)conteudo nome:(NSString*)nome tipo:(NSString*)tipo posicao:(CGPoint)posicao{
    
    SpriteCaixaNode *caixa = [[SpriteCaixaNode alloc] initWithConteudo:conteudo nome:nome tipo:tipo tamanho:tamanhoCaixa];
    [caixa setLabelEndereco:enderecoCaixa++];
    [caixa setUserInteractionEnabled:YES];
    [caixa setPosition:posicao];
    
    [self addChild:caixa];
}


-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
