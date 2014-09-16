//
//  containerView.h
//  ProjetoFinal
//
//  Created by Henrique Pereira de Lima on 15/09/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "IconeSecao.h"

@interface MenuNode : SKSpriteNode
    
    




- (void)abrirFechar;
- (id)initWithPosicaoAbrir : (CGPoint)abrir PosicaoFechar:(CGPoint)fechar;
- (void)criaIconePosicao:(CGPoint)posicao;
@end
