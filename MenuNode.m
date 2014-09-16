//
//  containerView.m
//  ProjetoFinal
//
//  Created by Henrique Pereira de Lima on 15/09/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "MenuNode.h"


@implementation MenuNode{
    
    BOOL aberto;
    SKAction *abrirMenu;
    SKAction *fecharMenu;
}

- (id)initWithPosicaoAbrir : (CGPoint)abrir PosicaoFechar:(CGPoint)fechar{
    
   self = [super init];
    
    //ConfigurandoMenu
    
    abrirMenu = [SKAction moveToX:abrir.x duration:0.5];
    fecharMenu = [SKAction moveToX:fechar.x duration:0.5];
    
    self.position = abrir;
    
    [self setTexture:[SKTexture textureWithImageNamed:@"fundo-descricao.png"]];
    self.size = CGSizeMake(200, 700);
    aberto = NO;
    
    
    NSArray *nomesImagens = [[NSArray alloc ]initWithObjects:@"abrir-caixa1.png",@"parte-operador.png", @"abrir-caixa2.png",@"abrir-caixa3.png",@"abrir-caixa4.png",nil];
    
    
    CGPoint posicaoNode = CGPointMake(self.frame.size.width / 4, self.frame.origin.y + 130);
    
    //adicionar objetos ao menu
    
    for (int i = 0; i < nomesImagens.count; i++) {
        
        SKSpriteNode *node = [[SKSpriteNode alloc]initWithImageNamed:[nomesImagens objectAtIndex:i]];
        
        node.size = CGSizeMake(100, 100);
        node.position = posicaoNode;
        posicaoNode.y -= node.size.height + 30;
        
        
        [self addChild:node];
    }
    
    
    
    return self;
}

- (void)abrirFechar{
    
    if (aberto) {
        
        [self fecharMenu];
        
        
    }else{
        [self abrirMenu];
    }
    
}

- (void)abrirMenu{
    
    [self runAction:abrirMenu];
    aberto = YES;
}

- (void)fecharMenu{
    
    [self runAction:fecharMenu];
    aberto = NO;
}

@end
