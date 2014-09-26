//
//  SpriteCaixaNode.h
//  testeSprite
//
//  Created by Felipe Costa Nascimento on 11/07/14.
//  Copyright (c) 2014 Felipe Costa Nascimento. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "MenuNode.h"

//PROTOCOLO QUE AVISA A SEU DELEGATE QUANDO A CAIXA FOR CLICADA
//@protocol SpriteCaixaNodeDelegate <NSObject>
//-(void)spriteCaixaClicado:(SKSpriteNode*)spriteCaixa;
//@end

@protocol SpriteCaixaDelegate <NSObject>

- (void)terminouGestureCaixa : (SKNode*)caixa;

@end

@interface SpriteCaixaNode : SKSpriteNode
{
    SKLabelNode *lblConteudo;
    SKLabelNode *lblNome;
    SKLabelNode *lblTipo;
    SKLabelNode *lblEndereco;
    
    SKAction *somCaixaAbrir;
    SKAction *somCaixaFechar;
    SKAction *animacaoAbrir;
    SKAction *animacaoFechar;
    SKAction *animacaoIntroducao;
    
    BOOL caixaAberta;
    BOOL toDentro;
    
}
@property SKScene *dono;
@property CGRect botaoMenu;
@property id<SpriteCaixaDelegate> myDelegate;

-(id)initWithConteudo:(NSString*)conteudo nome:(NSString*)nome tipo:(NSString*)tipo tamanho:(CGSize)tamanho;

-(void)setLabelEndereco:(int)numero;
-(void)setLabelConteudo:(NSString*)text;
-(void)setLabelNome:(NSString*)text;
-(void)setLabelTipo:(NSString*)text;
-(NSString *)retornaTipo;
-(NSString *)retornaNome;
-(NSString *)retornaConteudo;
-(void)executaSprite;
-(void)iniciarAnimacaoIntroducao;
@end
