//
//  SpriteCronometroNode.h
//  DesafioVariavel
//
//  Created by Felipe Costa Nascimento on 9/23/14.
//  Copyright (c) 2014 Felipe Costa Nascimento. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@protocol SpriteCronometroDelegate <NSObject>
-(void)tempoEsgotado;
-(void)animacaoDeEntradaCronometroFinalizada;
@end


@interface SpriteCronometroNode : SKSpriteNode
{
    int widthSize;
    float tempoTotal;
    SKAction *acaoIniciarContagem;
}

@property id<SpriteCronometroDelegate> myDelegate;

-(id)initWithTempoTotalEmSegundos:(float)tempo;
-(void)iniciarContagem;
-(void)prepararCronometro;
-(void)prepararCronometroComNovoTempo:(float)tempo;
-(void)pararContagem;
-(void)iniciarAnimacaoDeEntrada;
@end
