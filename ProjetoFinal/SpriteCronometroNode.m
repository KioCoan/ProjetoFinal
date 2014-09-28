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
        tempoTotal = tempo;
        
        
        //INICIALMENTE A BARRA DE TEMPO COMEÇA BEM PEQUENA MAS EM SEGUIDA JÁ INICIA UMA ANIMAÇÃO PRA FICAR TOTALMENTE PREENCHIDA
        [self setSize:CGSizeMake(1, self.size.height)];
        //[self prepararCronometro];

    }
    
    return self;
}

-(void)setTempoTotal:(float)tempo{
    tempoTotal = tempo;
}

-(void)prepararCronometro{
    [self removeAllActions];
    
    [self runAction:[self animacaoMoverCronometro]];
    [self runAction:[self animacaoResizeCronometro]];

}

-(SKAction*)animacaoMoverCronometro{
    return [SKAction moveToX:384 duration:1];
}

-(SKAction*)animacaoResizeCronometro{
    return [SKAction resizeToWidth:765 duration:1];
}


//ESTE MÉTODO FAZ AS ANIMAÇÕES 
-(void)iniciarAnimacaoDeEntrada{
    [self runAction:[self animacaoMoverCronometro]];
    [self runAction:[self animacaoResizeCronometro] completion:^{
        [self runAction:[SKAction waitForDuration:0.3] completion:^{
            [self removeAllActions];
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
    
    //POSIÇÃO QUE DEFINE QUE A BARRA FIQUE SEMPRE NO CANTO DIREITO
    int posicaoFinal = (self.position.x + (self.size.width / 2));
    
    //DUAS ANIMAÇÕES SÃO EXECUTADAS PARALELAMENTE PARA FAZER A BARRA DE TEMPO DIMINUIR CONFORME O TEMPO E FICAR SEMPRE NO CANTO DIREITO DA TELA
    [self runAction:[SKAction moveToX:posicaoFinal duration:tempoTotal] completion:^{
        [[self myDelegate] tempoEsgotado];
    }];
    [self runAction:[SKAction resizeToWidth:1 duration:tempoTotal]];
}


-(void)pararContagem{
    [self removeAllActions];
}

@end
