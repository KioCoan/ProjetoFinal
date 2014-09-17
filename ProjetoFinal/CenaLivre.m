//
//  CenaLivre.m
//  ProjetoFinal
//
//  Created by Henrique Pereira de Lima on 12/09/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "CenaLivre.h"
#import "SpriteCaixaNode.h"
#import "SpriteOperadorNode.h"
#import "MenuNode.h"

@implementation CenaLivre{
    
    MenuNode *menu;
    SKNode *conteudoAtivo;
    SKSpriteNode *botaoMenu;
}


-(id)init{
    
    self = [super init];
    
    if (self) {
        
        self.backgroundColor = [SKColor lightGrayColor];
        self.name = @"fundo";
        botaoMenu = [[SKSpriteNode alloc]initWithImageNamed:@"modo livre-09.png"];
        botaoMenu.position = CGPointMake(100, 100);
        botaoMenu.name = @"botaoMenu";
        [self addChild:botaoMenu];
        
        //ALOCANDO MENU
        menu = [[MenuNode alloc]initWithPosicaoAbrir:CGPointMake(245, 510) PosicaoFechar:CGPointMake(-245, 510) tamanho:CGSizeMake(500, 1030)];
        [self addChild:menu];
    }
    return self;
}


- (void)rodaeMuda{
    
    
    SKAction *rodaBotao = [SKAction rotateByAngle:-M_PI duration:0.5];
    
    [botaoMenu runAction:rodaBotao completion:^{
        botaoMenu.texture = [SKTexture textureWithImageNamed:@"modo livre-10.png"];
    }];
    
    
}

-(void)criaObjeto{
    
    IconeSecao *icone = (IconeSecao *)conteudoAtivo;
    
    if ([icone.tipo isEqualToString:@"variavel"]) {
        SpriteCaixaNode *caixa = [[SpriteCaixaNode alloc]init];
        caixa.position = conteudoAtivo.position;
        [menu addChild:caixa];
        [caixa iniciarAnimacaoIntroducao];
        [caixa setDono:menu];
        [conteudoAtivo removeFromParent];
    }else if ([icone.tipo isEqualToString:@"operador"]){
        
        SpriteOperadorNode *operador = [[SpriteOperadorNode alloc]init];
        operador.position = conteudoAtivo.position;
        [menu addChild:operador];
        
        [operador setDono:menu];
        [conteudoAtivo removeFromParent];
    }
    
    [menu abrirFechar];
    [self.myDelegate esconderNavigationController: [menu getAberto]];
    
}



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    
    UITouch *touch = [touches anyObject];
    CGPoint location =  [touch locationInNode:self];
    conteudoAtivo = [self nodeAtPoint:location];
    
    [self rodaeMuda];
    
    if ([conteudoAtivo.name isEqualToString:@"botaoMenu"]) {
        [menu abrirFechar];
        [self.myDelegate esconderNavigationController: [menu getAberto]];
    }else if ([menu getAberto] && [conteudoAtivo.name isEqualToString:@"fundo"]){
        [menu abrirFechar];
        [self.myDelegate esconderNavigationController: [menu getAberto]];
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    
    
    //SE A POSIÇÃO QUE FOI CLICADA É A MESMA DO SPRITE DA CAIXA, O SPRITE É MOVIDO
    
    if ([conteudoAtivo.name isEqualToString:@"iconeMenu"]) {
        
        CGPoint location = [touch locationInNode:menu];
        [conteudoAtivo setPosition:location];
        
    }
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    if ([conteudoAtivo.name isEqualToString:@"iconeMenu"]) {
        
        
        [self criaObjeto];
    }
    
}

@end
