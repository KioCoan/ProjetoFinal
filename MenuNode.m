//
//  containerView.m
//  ProjetoFinal
//
//  Created by Henrique Pereira de Lima on 15/09/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "MenuNode.h"


@implementation MenuNode{
    NSMutableArray *secoes;
    BOOL aberto;
    SKAction *abrirMenu;
    SKAction *fecharMenu;
    int nSecoes;
}

- (BOOL)getAberto{
    return aberto;
}

- (SecaoMenu *)criaSecaoIndice:(int)indice{
    
    
    switch (indice) {
        
        //VARIAVEL
        case 0:
            return [[SecaoMenuVariavel alloc]init];
            break;
            
        default:
            break;
    }
    
    
    
    return nil;
}


- (id)initWithPosicaoAbrir : (CGPoint)abrir PosicaoFechar:(CGPoint)fechar{
    
   self = [super init];
    
    // CONFIGURANDO MENU
    
    abrirMenu = [SKAction moveToX:abrir.x duration:0.5];
    fecharMenu = [SKAction moveToX:fechar.x duration:0.5];
    
    self.position = fechar;
    
    [self setTexture:[SKTexture textureWithImageNamed:@"fundo-descricao.png"]];
    self.size = CGSizeMake(200, 700);
    aberto = NO;
    
    
    // CRIANDO SECOES
    
    secoes = [NSMutableArray array];
    
    nSecoes = 1;
    
    
    for (int i = 0; i < nSecoes; i++) {
        
        [secoes addObject:[self criaSecaoIndice:i]];
        
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
//    CGPoint posicaoNode = CGPointMake(self.frame.size.width / 4, self.frame.origin.y + 130);
//    
//    //adicionar objetos ao menu
//    
//    for (int i = 1; i < 6; i++) {
//        
//       IconeSecao *icone = [self criaIconeIndice:i];
//        
//        icone.size = CGSizeMake(100, 100);
//        icone.position = posicaoNode;
//        icone.posicaoAnterior = posicaoNode;
//        posicaoNode.y -= icone.size.height + 30;
//        
//        
//        [self addChild:icone];
//    }
    
    
    
    return self;
}

- (IconeSecao *)criaIconeIndice:(int)indice{
    
    IconeSecao *icone;
    
    switch (indice) {
        case 1:
            icone = [[IconeSecao alloc]initWithImageNamed:@"abrir-caixa1.png"];
            icone.tipo = @"variavel";
            break;
        case 2:
            icone = [[IconeSecao alloc]initWithImageNamed:@"parte-operador.png"];
            icone.tipo = @"operador";
            break;
        case 3:
            icone = [[IconeSecao alloc]initWithImageNamed:@"se-verde.png"];
            icone.tipo = @"se";
            break;
        case 4:
            icone = [[IconeSecao alloc]initWithImageNamed:@"valores-errado.png"];
            icone.tipo = @"senao";
            break;
        case 5:
            icone = [[IconeSecao alloc]initWithImageNamed:@"valores-verdadeiro.png"];
            icone.tipo = @"senaoSE";
            break;
        
        default:
            NSLog(@"erro, switch default opcao");
            break;
    }
    
    icone.name = @"iconeMenu";
    
    return icone;
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
