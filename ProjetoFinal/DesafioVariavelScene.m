//
//  MyScene.m
//  DesafioVariavel
//
//  Created by Felipe Costa Nascimento on 9/20/14.
//  Copyright (c) 2014 Felipe Costa Nascimento. All rights reserved.
//

#import "DesafioVariavelScene.h"

@implementation DesafioVariavelScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        
        nodeFundo = [[SKSpriteNode alloc] initWithTexture:[SKTexture textureWithImageNamed:@"fundo-desafio.png"]];
        //[nodeFundo setSize:CGSizeMake(500, 500)];
        [nodeFundo setPosition:CGPointMake(self.size.width / 2, self.size.height / 2)];
        [nodeFundo setAlpha:0];
        [self addChild:nodeFundo];
        
        nodeMaquina = [[SKSpriteNode alloc] initWithImageNamed:@"maquina.png"];
        [nodeMaquina setSize:CGSizeMake(562, 583)];
        [nodeMaquina setPosition:CGPointMake(self.size.width / 2, self.size.height + 300)];
        [self addChild:nodeMaquina];
        
        nodeVisor = [[SpriteVisorNode alloc] init];
        [nodeVisor setPosition:CGPointMake(0, 70)];
        [nodeVisor setMyDelegate:self];
        [nodeMaquina addChild:nodeVisor];
        
        nodeEsteira = [[SpriteEsteiraNode alloc] init];
        [nodeEsteira setPosition:CGPointMake(-self.size.width / 2, 110)];
        [nodeEsteira setMyDelegate:self];
        [self addChild:nodeEsteira];
        
        nodeCronometro = [[SpriteCronometroNode alloc] initWithTempoTotalEmSegundos:6];
        [nodeCronometro setPosition:CGPointMake(self.size.width - 5, self.size.height - 40)];
        [nodeCronometro setMyDelegate:self];
        [self addChild:nodeCronometro];
        
        //[nodeEsteira posicionarCaixasParaDesafio];
        
        [self iniciarAnimacaoFundo];
    }
    
    
    return self;
}

-(void)iniciarAnimacaoFundo{
    SKAction *fade = [SKAction fadeInWithDuration:1];
    
    [nodeFundo runAction:fade completion:^{
        [nodeEsteira iniciarAnimacaoDeEntrada];
    }];
}

-(void)iniciarAnimacaoMaquina{
    SKAction *descer = [SKAction moveToY:self.size.height / 1.5 duration:1.5];
    [descer setTimingMode:SKActionTimingEaseOut];
    
    [nodeMaquina runAction:descer completion:^{
        [nodeCronometro iniciarAnimacaoDeEntrada];
    }];
}

-(void)animacaoDeEntradaCronometroFinalizada{
    [nodeEsteira posicionarCaixasParaDesafio];
}

-(void)animacaoEsteiraDeEntradaFinalizado{
    [self iniciarAnimacaoMaquina];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    //[nodeEsteira iniciarAnimacaoDesafio];
}

//QUANDO A ESTEIRA É LEVANTADA OU ABAIXADA, QUEM CRIOU ESTE PROTOCÓLO IRÁ CHAMAR ESTE MÉTODO, QUE POR SUA VEZ VERIFICAR O QUE ACONTECEU COM A ESTEIRA
-(void)spriteEsteiraLevantado:(BOOL)resultado tiposVariavelGerados:(NSMutableArray *)tipos{
    
    //CASO A ESTEIRA TENHA SE LEVANTADO, SIGNIFICA QUE O DESAFIO COMEÇOU
    if(resultado){
        [nodeEsteira habilitarToqueNasCaixas:YES];
        [nodeVisor gerarValorAleatorioEntreOsTipos:tipos];
        [nodeCronometro iniciarContagem];
        
    }else{
        [nodeEsteira iniciarAnimacaoFimDoDesafio];
        [nodeCronometro prepararCronometro];
    }
}


-(void)caixaFoiClicada{
    [nodeCronometro pararContagem];
    [nodeEsteira habilitarToqueNasCaixas:NO];
}

//QUANDO O USUÁRIO RESPONDE O DESAFIO, QUEM CRIOU ESTE PROTOCÓLO IRÁ CHAMAR ESTE MÉTODO, QUE POR SUA VEZ MANDA PARAR O CRONÔMETRO E VERIFICA A RESPOSTA
-(void)respostaSelecionada:(NSString *)tipo{
    [nodeCronometro pararContagem];
    [nodeVisor validarResposta:tipo];
    
}


-(void)respostaCorretaFinalizado{
    [nodeEsteira iniciarAnimacaoMoverEsteira];
    [nodeVisor esconderValorDaTela:YES];
    NSLog(@"Resposta Correta");
}


-(void)respostaErradaFinalizado{
    [nodeEsteira iniciarAnimacaoMoverEsteira];
    [nodeVisor esconderValorDaTela:YES];
    NSLog(@"Resposta Errada");
}


//QUANDO AS CAIXAS ESTÃO PRONTAS PARA SEREM ERGUIDAS PELA ESTEIRA, QUEM CRIOU ESTE PROTOCÓLO IRÁ CHAMAR ESTE MÉTODO, QUE POR SUA VEZ MANDA A ESTEIRA INICIAR O DESAFIO(ERGUER AS CAIXAS E SOLTAR O TEMPO DE RESPOSTA)
-(void)caixasPosicionadasParaDesafio{
    [nodeEsteira iniciarAnimacaoDesafio];
}

//QUANDO O DESAFIO TERMINAR, QUEM CRIOU ESTE PROTOCÓLO IRÁ CHAMAR ESTE MÉTODO, QUE POR SUA VEZ MANDA MODIFICAR O TIPO DAS CAIXAS E DEPOIS MANDA POSICIONA-LAS PARA INICIAR O DESAFIO
-(void)desafioAtualTerminou{
    [nodeEsteira modificarTipoDasCaixas];
    [nodeEsteira posicionarCaixasParaDesafio];
}

-(void)tempoEsgotado{
    NSLog(@"Tempo Esgotado");
    [nodeEsteira habilitarToqueNasCaixas:NO];
    [nodeVisor esconderValorDaTela:YES];
    [nodeEsteira iniciarAnimacaoMoverEsteira];
}



@end
