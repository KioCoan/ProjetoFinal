//
//  SpriteOperadorResultado.m
//  testeSprite
//
//  Created by Felipe Costa Nascimento on 18/07/14.
//  Copyright (c) 2014 Felipe Costa Nascimento. All rights reserved.
//

#import "OperadorResultadoNode.h"

static const int NUM_TEXTURAS = 10;

@implementation OperadorResultadoNode

-(id)initWithResultado:(NSString*)resultado{
    self = [super init];
    
    if(self){
        [self inicializaClasse:resultado];
    }
    
    return self;
}

-(id)init{
    
    self = [super init];
    
    if(self){
        [self inicializaClasse:@""];
    }
    
    return self;
}

//METODO QUE CHAMA TODOS OS METODOS QUE INICIALIZAM O NECESSÁRIO
-(void)inicializaClasse:(NSString*)resultado{
    [self setTexture:[SKTexture textureWithImageNamed:[NSString stringWithFormat:@"parte-resultado%d.png", NUM_TEXTURAS]]];
    [self setName:@"resultado"];
    [self setSize:CGSizeMake(209, 77)];
    [self inicializaLabelResultado:resultado];
    [self inicializaAnimacaoDescer];
    [self inicializaAnimacaoSubir];
    estaVisivel = NO;
}


-(void)inicializaLabelResultado:(NSString*)resultado{
    lblResultado = [SKLabelNode labelNodeWithFontNamed:@"Avenir Next Condensed Medium"];
    [lblResultado setText:resultado];
    [lblResultado setFontSize:35];
    [lblResultado setFontColor:[SKColor whiteColor]];
    [lblResultado setPosition:CGPointMake(0, -25)];
    [lblResultado setAlpha:0];
    [lblResultado setHorizontalAlignmentMode:SKLabelHorizontalAlignmentModeCenter];
    
    [self addChild:lblResultado];
}


-(void)inicializaAnimacaoSubir{
    //CRIO UMA ANIMAÇAO REVERSA À DE DESCER   
    animacaoSubir = [animacaoDescer reversedAction];
}


-(void)inicializaAnimacaoDescer{
    //CRIO TEXTURAS PARA TODAS OS SPRITES DA PARTE DE RESULTADO EM ORDEM INVERSA (PARTE RESULTAOD SUBINDO)
    NSMutableArray *vetorTexturas = [[NSMutableArray alloc] init];
    
    for(int i=NUM_TEXTURAS; i>=1; i--){
        //OS SPRITES ESTÃO NUMERADOS, PORTANTO O CONTADOR DO LAÇO É UTILIZADO PARA GERAR TODOS OS SPRITES
        SKTexture *textura = [SKTexture textureWithImageNamed:[NSString stringWithFormat:@"parte-resultado%d.png", i]];
        
        [vetorTexturas addObject:textura];
    }
    
    animacaoDescer = [SKAction animateWithTextures:vetorTexturas timePerFrame:0.04];
}



-(void)iniciarAnimacao{
    //VERIFICA SE O SPRITE ESTÁ VISIVEL NA TELA
    if(estaVisivel){
        
        //CRIA UMA ANIMAÇÃO DE FADE QUE FARÁ A LABEL APARECER
        SKAction *animacaoAparecer = [SKAction fadeAlphaTo:0 duration:animacaoSubir.duration];
        
        //A LABEL EXECUTA A ANIMAÇÃO
        [lblResultado runAction:animacaoAparecer completion:^{
            [lblResultado removeAllActions];
            estaVisivel = NO;
        }];
    
    }else{
        //CRIA UMA ANIMAÇÃO DE FADE QUE FARÁ A LABEL SUMIR
        SKAction *animacaoSumir = [SKAction fadeAlphaTo:1 duration:animacaoSubir.duration];
        
        //A LABEL EXECUTA A ANIMAÇÃO
        [lblResultado runAction:animacaoSumir completion:^{
            [lblResultado removeAllActions];
            estaVisivel = YES;
        }];
    }
}



-(SKAction*)getAnimacaoSubir{
    return animacaoSubir;
}

-(SKAction*)getAnimacaoDescer{
    return animacaoDescer;
}


-(void)setLabelResultado:(NSString*)resultado{
    [lblResultado setText:resultado];
}

@end
