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
    SKAction *abrirMenu;
    SKAction *fecharMenu;
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


@end
