//
//  SpriteCaixaNode.h
//  testeSprite
//
//  Created by Felipe Costa Nascimento on 11/07/14.
//  Copyright (c) 2014 Felipe Costa Nascimento. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

//PROTOCOLO QUE AVISA A SEU DELEGATE QUANDO A CAIXA FOR CLICADA
//@protocol SpriteCaixaNodeDelegate <NSObject>
//-(void)spriteCaixaClicado:(SKSpriteNode*)spriteCaixa;
//@end


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
}

//@property id <SpriteCaixaNodeDelegate> myDelegate;

-(id)initWithConteudo:(NSString*)conteudo nome:(NSString*)nome tipo:(NSString*)tipo tamanho:(CGSize)tamanho;

-(void)setLabelEndereco:(int)numero;
-(void)setLabelConteudo:(NSString*)text;
-(void)setLabelNome:(NSString*)text;
-(void)setLabelTipo:(NSString*)text;
<<<<<<< HEAD
=======
-(NSString *)retornaTipo;
-(NSString *)retornaNome;
-(NSString *)retornaConteudo;
-(void)abrirCaixa;
-(void)fecharCaixa;
>>>>>>> FETCH_HEAD
-(void)executaSprite;
-(void)iniciarAnimacaoIntroducao;
-(void)alteraCorLabels:(NSString *)tipo;
@end
