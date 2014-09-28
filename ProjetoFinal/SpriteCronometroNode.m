//
//  SpriteCronometroNode.m
//  DesafioVariavel
//
//  Created by Felipe Costa Nascimento on 9/23/14.
//  Copyright (c) 2014 Felipe Costa Nascimento. All rights reserved.
//

#import "SpriteCronometroNode.h"

@implementation SpriteCronometroNode

-(id)init{
    self = [super init];
    
    if(self){
        tempoTotal = 0;
    }
    return self;
}

-(id)initWithTempoTotalEmSegundos:(float)tempo{
    self = [super initWithImageNamed:@"cronometro.png"];
    
    if(self){
        
        //INICIALMENTE A BARRA DE TEMPO COMEÇA BEM PEQUENA MAS EM SEGUIDA JÁ INICIA UMA ANIMAÇÃO PRA FICAR TOTALMENTE PREENCHIDA
        [self setSize:CGSizeMake(1, self.size.height)];
        
        tempoTotal = tempo;
        widthSize = 768;
        
        [self inicializarAnimacaoIniciarContagem];
    }
    
    return self;
}


-(SKAction*)gerarAnimacaoPrepararCronometro{
    //CÁLCULO PARA MANTER A BARRINHA SEMPRE NO CANTO DIREITO
    int posicaoFinal = -((widthSize - self.size.width) / 2);
    
    SKAction *mover = [SKAction moveByX:posicaoFinal y:0 duration:1];
    SKAction *resize = [SKAction resizeToWidth:widthSize duration:1];
    
    //ANIMAÇÃO DO TIPO GROUP, EXECUTA UM VETOR DE ANIMAÇÕES AO MESMO TEMPO
    return [SKAction group:@[mover, resize]];
}

-(void)inicializarAnimacaoIniciarContagem{
    SKAction *mover = [SKAction moveByX:widthSize / 2 y:0 duration:tempoTotal];
    SKAction *resize = [SKAction resizeToWidth:1 duration:tempoTotal];
    
    //ANIMAÇÃO DO TIPO GROUP, EXECUTA UM VETOR DE ANIMAÇÕES AO MESMO TEMPO
    acaoIniciarContagem = [SKAction group:@[mover, resize]];
}

-(void)setTempoTotal:(float)tempo{
    tempoTotal = tempo;
    [acaoIniciarContagem setDuration:tempoTotal];
}


-(void)prepararCronometro{
    [self removeAllActions];
    
    [self runAction:[self gerarAnimacaoPrepararCronometro]];

}


//ESTE MÉTODO FAZ AS ANIMAÇÕES 
-(void)iniciarAnimacaoDeEntrada{
    [self runAction:[self gerarAnimacaoPrepararCronometro] completion:^{
        [self runAction:[SKAction waitForDuration:0.3] completion:^{
            [[self myDelegate] animacaoDeEntradaCronometroFinalizada];
        }];
    }];
}

-(void)prepararCronometroComNovoTempo:(float)tempo{
    tempoTotal = tempo;
    [self prepararCronometro];

}


-(void)iniciarContagem{
    //SE ESTE MÉTODO FOR CHAMADO E O TEMPO ESTIVER COM ZERO, É LANÇADA UMA EXCESSÃO DE ERRO
    if (tempoTotal == 0) {
        @throw [NSException exceptionWithName:@"Tempo total não definido" reason:@"É necessário definir um tempo total maior que 0 para que o cronômetro possa funcionar." userInfo:nil];
    }
    
    [self runAction:acaoIniciarContagem completion:^{
        [[self myDelegate] tempoEsgotado];
    }];
}


-(void)pararContagem{
    [self removeAllActions];
}

@end
