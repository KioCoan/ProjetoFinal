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
    
    self.position = fechar;
    
    [self setTexture:[SKTexture textureWithImageNamed:@"fundo-descricao.png"]];
    self.size = CGSizeMake(200, 700);
    aberto = NO;
    
    
    
    
    
    CGPoint posicaoNode = CGPointMake(self.frame.size.width / 4, self.frame.origin.y + 130);
    
    //adicionar objetos ao menu
    
    for (int i = 1; i < 6; i++) {
        
       IconeMenu *icone = [self criaIconeIndice:i];
        
        icone.size = CGSizeMake(100, 100);
        icone.position = posicaoNode;
        icone.posicaoAnterior = posicaoNode;
        posicaoNode.y -= icone.size.height + 30;
        
        
        [self addChild:icone];
    }
    
    
    
    return self;
}

- (IconeMenu *)criaIconeIndice:(int)indice{
    
    IconeMenu *icone;
    
    switch (indice) {
        case 1:
            icone = [[IconeMenu alloc]initWithImageNamed:@"abrir-caixa1.png"];
            icone.tipo = @"variavel";
            break;
        case 2:
            icone = [[IconeMenu alloc]initWithImageNamed:@"parte-operador.png"];
            icone.tipo = @"operador";
            break;
        case 3:
            icone = [[IconeMenu alloc]initWithImageNamed:@"se-verde.png"];
            icone.tipo = @"se";
            break;
        case 4:
            icone = [[IconeMenu alloc]initWithImageNamed:@"valores-errado.png"];
            icone.tipo = @"senao";
            break;
        case 5:
            icone = [[IconeMenu alloc]initWithImageNamed:@"valores-verdadeiro.png"];
            icone.tipo = @"senaoSE";
            break;
        
        default:
            NSLog(@"erro, switch default opcao");
            break;
    }
    
    icone.name = @"iconeMenu";
    
    return icone;
}

- (void)criaIconePosicao:(CGPoint)posicao{
    
    
    
    
    
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
