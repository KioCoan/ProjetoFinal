//
//  SpriteCaixaNode.h
//  testeSprite
//
//  Created by Felipe Costa Nascimento on 11/07/14.
//  Copyright (c) 2014 Felipe Costa Nascimento. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface SpriteCaixaNode : SKSpriteNode
{
    
    SKLabelNode *lblConteudo;
    SKLabelNode *lblNome;
    SKLabelNode *lblTipo;
    SKLabelNode *lblEndereco;
    
    SKAction *animacaoAbrir;
    SKAction *animacaoFechar;
    
    BOOL caixaAberta;
}

-(id)initWithConteudo:(NSString*)conteudo nome:(NSString*)nome tipo:(NSString*)tipo tamanho:(CGSize)tamanho;

-(void)setLabelEndereco:(int)numero;
-(void)setLabelConteudo:(NSString*)text;
-(void)setLabelNome:(NSString*)text;
-(void)setLabelTipo:(NSString*)text;
-(NSString *)retornaTipo;
-(void)abrirCaixa;
-(void)fecharCaixa;

@end
