//
//  SpriteCaixaNode.m
//  DesafioVariavel
//
//  Created by Felipe Costa Nascimento on 9/21/14.
//  Copyright (c) 2014 Felipe Costa Nascimento. All rights reserved.
//

#import "SpriteCaixinhaNode.h"


@implementation SpriteCaixinhaNode

-(id)initWithTipoVariavel:(NSString*)tipo indexPosição:(int)posicao{
    self = [super initWithImageNamed:[NSString stringWithFormat:@"caixa%d-vazia.png", posicao]];
    
    if(self){
        meuIndex = posicao;
        
        lblTipo = [[SKLabelNode alloc] init];
        [lblTipo setText:tipo];
        [lblTipo setFontColor:[SKColor blackColor]];
        [lblTipo setFontSize:self.size.width / lblTipo.frame.size.width + 25];
        [lblTipo setHorizontalAlignmentMode:SKLabelHorizontalAlignmentModeCenter];
        [lblTipo setVerticalAlignmentMode:SKLabelVerticalAlignmentModeCenter];
        [self addChild:lblTipo];
        
        [self inicializarAnimacaoMoverX];
        [self inicializarAnimacaoPular];
        
        [self setUserInteractionEnabled:NO];
    }
    
    
    return self;
}


-(void)inicializarAnimacaoPular{
    int distancia = 15;
    float duracao = 0.2;
    
    //É CRIADO A ANIMAÇÃO QUE FAZ COM QUE A CAIXA SUBA
    SKAction *subir = [SKAction moveByX:0 y:distancia duration:duracao];
    [subir setTimingMode:SKActionTimingEaseOut];
    
    //É CRIADO A ANIMAÇÃO QUE FAZ COM QUE A CAIXA DESÇA
    SKAction *descer = [SKAction moveByX:0 y:-distancia duration:duracao];
    [descer setTimingMode:SKActionTimingEaseIn];
    
    acaoPular = [SKAction sequence:@[subir, descer]];
}

-(void)inicializarAnimacaoMoverX{
    moverX = [SKAction moveByX:695 y:0 duration:1.3];
    [moverX setTimingMode:SKActionTimingEaseOut];
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //ESTA MÉTODO APENAS AVISA QUE UMA CAIXA FOI CLICADA. A CENA FICA ENCARREGADA DE MANDAR O CRONÔMETRO PARAR
    [[self myDelegate] caixaFoiClicada];
    
    [self iniciarAnimacaoToque];
}


-(void)iniciarAnimacaoToque{
    //APÓS A CAIXA SUBIR É EXECUTADO A ANIMAÇÃO PARA DESCER A CAIXA
    [self runAction:acaoPular completion:^{
        
        //AVISA AO DELEGATE QUE A CAIXA QUE FOI CLICADA É A QUE ESTÁ SENDO PASSADA POR PARÂMETRO
        [[self myDelegate] caixaClicadaDoTipo:[lblTipo text]];
    }];
}


-(void)iniciarAnimacaoMoverCaixaPara:(int)posicaoFinal fimDesafio:(BOOL)resposta{
    //ESTA CONDIÇÃO É USADA PARA QUE APENAS 1 CAIXA AVISE O DELEGATE QUE A ANIMAÇÃO TERMINOU
    if (meuIndex == 3) {
        [self runAction:moverX completion:^{
            [[self myDelegate] animacaoMoverCaixaFinalizado:resposta];
        }];
    
    }else{
        [self runAction:moverX];
    }
    
}


-(NSString*)getTipo{
    return [lblTipo text];
}

-(void)setTipo:(NSString*)tipo{
    [lblTipo setText:tipo];
}

@end
