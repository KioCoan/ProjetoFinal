//
//  SpriteCronometroNode.m
//  DesafioVariavel
//
//  Created by Felipe Costa Nascimento on 9/23/14.
//  Copyright (c) 2014 Felipe Costa Nascimento. All rights reserved.
//

#import "SpriteCronometroNode.h"

@implementation SpriteCronometroNode


-(id)initWithTempoTotalEmSegundos:(float)tempo progressaoDeTempo:(float)progressao{
    self = [super initWithImageNamed:@"cronometro.png"];
    
    if(self){
        
        [self inicializarClasse:tempo];
        [self setProgressaoTempo:progressao];
    }
    
    return self;
}

-(id)initWithTempoTotalEmSegundos:(float)tempo{
    self = [super initWithImageNamed:@"cronometro.png"];
    
    if(self){
        [self inicializarClasse:tempo];
        [self setProgressaoTempo:0];
    }
    
    return self;
}

-(void)inicializarClasse:(float)tempo{
    //INICIALMENTE A BARRA DE TEMPO COMEÇA BEM PEQUENA MAS EM SEGUIDA JÁ INICIA UMA ANIMAÇÃO PRA FICAR TOTALMENTE PREENCHIDA
    [self setSize:CGSizeMake(0, self.size.height)];
    
    tempoTotal = tempo;
    
    widthSize = 768;
    
    [self inicializarAnimacaoIniciarContagem];
}


-(SKAction*)gerarAnimacaoPrepararCronometro{
    //CÁLCULO PARA MANTER A BARRINHA SEMPRE NO CANTO DIREITO
    float posicaoFinal = -((widthSize - self.size.width) / 2);
    
    SKAction *mover = [SKAction moveByX:posicaoFinal y:0 duration:1];
    SKAction *resize = [SKAction resizeToWidth:widthSize duration:1];
    
    //ANIMAÇÃO DO TIPO GROUP, EXECUTA UM VETOR DE ANIMAÇÕES AO MESMO TEMPO
    return [SKAction group:@[mover, resize]];
}


-(void)inicializarAnimacaoIniciarContagem{
    SKAction *mover = [SKAction moveByX:widthSize / 2 y:0 duration:tempoTotal];
    SKAction *resize = [SKAction resizeToWidth:0 duration:tempoTotal];
    
    //ANIMAÇÃO DO TIPO GROUP, EXECUTA UM VETOR DE ANIMAÇÕES AO MESMO TEMPO
    acaoIniciarContagem = [SKAction group:@[mover, resize]];
}


//MODIFICA O TEMPO E INICIALIZA A ACTION COM A NOVA DURAÇAO DE TEMPO
-(void)setTempoTotal:(float)tempo{
    if (tempo == 0) {
        return;
    }
    
    tempoTotal = tempo;
    [self inicializarAnimacaoIniciarContagem];
}


-(void)prepararCronometro{
    [self removeAllActions];
    [self runAction:[self gerarAnimacaoPrepararCronometro]];

}


-(void)aumentarTempoTotalConformeTempoDeProgresso{
    //CHAMA METODO QUE AUMENTA O TEMPO DO CRONOMETRO COM BASE NA VARIAVEL progressaoTempo DEFINIDA ANTERIORMENTE
    [self setTempoTotal:tempoTotal + self.progressaoTempo];
}

-(void)diminuirTempoTotalConformeTempoDeProgresso{
    //CHAMA METODO QUE DIMINUI O TEMPO DO CRONOMETRO COM BASE NA VARIAVEL progressaoTempo DEFINIDA ANTERIORMENTE
    [self setTempoTotal:tempoTotal - self.progressaoTempo];
}



//ESTE MÉTODO FAZ AS ANIMAÇÕES 
-(void)iniciarAnimacaoDeEntrada{
    [self runAction:[self gerarAnimacaoPrepararCronometro]];
    [[self myDelegate] animacaoDeEntradaCronometroFinalizada];
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
