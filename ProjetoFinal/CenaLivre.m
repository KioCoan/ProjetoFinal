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
}


-(id)init{
    
    self = [super init];
    
    if (self) {
        
        self.backgroundColor = [SKColor lightGrayColor];
        
        SKSpriteNode *botaoMenu = [[SKSpriteNode alloc]initWithImageNamed:@"modo livre-09.png"];
        botaoMenu.position = CGPointMake(100, 100);
        botaoMenu.name = @"botaoMenu";
        [self addChild:botaoMenu];
        
        
        menu = [[MenuNode alloc]initWithPosicaoAbrir:CGPointMake(105, 500) PosicaoFechar:CGPointMake(-100, 550)];
        
        
        [self addChild:menu];
        
        
        
        
        
        
        
//        SKSpriteNode *caixa = [[SKSpriteNode alloc]initWithImageNamed:@"abrir-caixa1.png"];
//        
//        caixa.size = CGSizeMake(100, 100);
//        caixa.position = CGPointMake(400, 300);
//        caixa.name = @"iconeMenu";
//        [self addChild:caixa];
        
    }
    return self;
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
    
    if ([conteudoAtivo.name isEqualToString:@"botaoMenu"]) {
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
