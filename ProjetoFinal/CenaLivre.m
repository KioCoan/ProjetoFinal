//
//  CenaLivre.m
//  ProjetoFinal
//
//  Created by Henrique Pereira de Lima on 12/09/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "CenaLivre.h"
#import "SpriteCaixaNode.h"
#import "MenuNode.h"

@implementation CenaLivre{
    
    MenuNode *menu;
    SKNode *conteudoAtivo;
}


-(id)init{
    
    self = [super init];
    
    if (self) {
        
        self.backgroundColor = [SKColor lightGrayColor];
        menu = [[MenuNode alloc]initWithPosicaoAbrir:CGPointMake(105, 500) PosicaoFechar:CGPointMake(-100, 500)];
        
        
        [self addChild:menu];
        
        SKSpriteNode *botaoMenu = [[SKSpriteNode alloc]initWithImageNamed:@"menuIcon.png"];
        
        botaoMenu.size = CGSizeMake(80, 80);
        botaoMenu.position = CGPointMake(50, 915);
        botaoMenu.name = @"botaoMenu";
        [self addChild:botaoMenu];
        
        
//        SKSpriteNode *caixa = [[SKSpriteNode alloc]initWithImageNamed:@"abrir-caixa1.png"];
//        
//        caixa.size = CGSizeMake(100, 100);
//        caixa.position = CGPointMake(400, 300);
//        caixa.name = @"iconeMenu";
//        [self addChild:caixa];
        
    }
    return self;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    
    UITouch *touch = [touches anyObject];
    CGPoint location =  [touch locationInNode:self];
    conteudoAtivo = [self nodeAtPoint:location];
    
    if ([conteudoAtivo.name isEqualToString:@"botaoMenu"]) {
        [menu abrirFechar];
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
        
        [menu abrirFechar];
        [self criaObjeto];
    }
    
    
}

-(void)criaObjeto{
    
    IconeMenu *icone = (IconeMenu *)conteudoAtivo;
    
    if ([icone.tipo isEqualToString:@"variavel"]) {
        SpriteCaixaNode *caixa = [[SpriteCaixaNode alloc]init];
        caixa.position = conteudoAtivo.position;
        [menu addChild:caixa];
        [caixa iniciarAnimacaoIntroducao];
        [caixa setMenu:menu];
        [conteudoAtivo removeFromParent];
    }
    
    
    
}
@end