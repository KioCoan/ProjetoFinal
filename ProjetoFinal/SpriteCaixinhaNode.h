//
//  SpriteCaixaNode.h
//  DesafioVariavel
//
//  Created by Felipe Costa Nascimento on 9/21/14.
//  Copyright (c) 2014 Felipe Costa Nascimento. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>


@protocol SpriteCaixinhaDelegate <NSObject>
-(void)caixaFoiClicada;
-(void)caixaClicadaDoTipo:(NSString*)tipo;
-(void)animacaoMoverCaixaFinalizado:(BOOL)fimDesafio;
@end


@interface SpriteCaixinhaNode : SKSpriteNode
{
    SKLabelNode *lblTipo;
    int meuIndex;
    SKAction *moverX;
    SKAction *acaoPular;
}

@property id <SpriteCaixinhaDelegate> myDelegate;

-(void)setTipo:(NSString*)tipo;
-(id)initWithTipoVariavel:(NSString*)tipo indexPosição:(int)posicao;
-(void)iniciarAnimacaoMoverCaixaPara:(int)posicaoFinal fimDesafio:(BOOL)resposta;
-(NSString*)getTipo;

@end
