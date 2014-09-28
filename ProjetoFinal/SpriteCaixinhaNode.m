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
        
        lblTipo = [[SKLabelNode alloc] init];
        [lblTipo setText:tipo];
        [lblTipo setFontColor:[SKColor blackColor]];
        [lblTipo setFontSize:self.size.width / lblTipo.frame.size.width + 25];
        [lblTipo setHorizontalAlignmentMode:SKLabelHorizontalAlignmentModeCenter];
        [lblTipo setVerticalAlignmentMode:SKLabelVerticalAlignmentModeCenter];
        
        [self addChild:lblTipo];
        
        [self setUserInteractionEnabled:NO];
    }
    
    
    return self;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //ESTA MÉTODO APENAS AVISA QUE UMA CAIXA FOI CLICADA. A CENA FICA ENCARREGADA DE MANDAR O CRONÔMETRO PARAR
    [[self myDelegate] caixaFoiClicada];
    
    [self iniciarAnimacaoToque];
}


-(void)iniciarAnimacaoToque{
    int distanciaSubir = self.position.y + 15;
    int distanciaDescer = distanciaSubir - 15;
    float duracao = 0.2;
    
    //É CRIADO A ANIMAÇÃO QUE FAZ COM QUE A CAIXA SUBA
    SKAction *subir = [SKAction moveToY:distanciaSubir duration:duracao];
    [subir setTimingMode:SKActionTimingEaseOut];
    
    //É CRIADO A ANIMAÇÃO QUE FAZ COM QUE A CAIXA DESÇA
    SKAction *descer = [SKAction moveToY:distanciaDescer duration:duracao];
    [descer setTimingMode:SKActionTimingEaseIn];
    
    
    //PRIMEIRO É EXECUTADO A ANIMAÇÃO DE SUBIR A CAIXA
    [self runAction:subir completion:^{
        
        //APÓS A CAIXA SUBIR É EXECUTADO A ANIMAÇÃO PARA DESCER A CAIXA
        [self runAction:descer completion:^{
            
            [self removeAllActions];
            
            //AVISA AO DELEGATE QUE A CAIXA QUE FOI CLICADA É A QUE ESTÁ SENDO PASSADA POR PARÂMETRO
            [[self myDelegate] caixaClicadaDoTipo:[lblTipo text]];
        }];
    }];
}



-(NSString*)getTipo{
    return [lblTipo text];
}

-(void)setTipo:(NSString*)tipo{
    [lblTipo setText:tipo];
}

@end
