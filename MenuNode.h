//
//  containerView.h
//  ProjetoFinal
//
//  Created by Henrique Pereira de Lima on 15/09/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "IconeSecao.h"
#import "SecaoMenu.h"
#import "SecaoMenuVariavel.h"
#import "SecaoMenuOperador.h"




@interface MenuNode : SKSpriteNode <SecaoMenuDelegate>

- (void)abrirFechar;
- (id)initWithPosicaoAbrir : (CGPoint)abrir  tamanho:(CGSize)tamanho;
- (BOOL)getAberto;
- (void)removeTudo;
- (void)iniciarScroll;
- (UIScrollView *)retornaMenuScroll;
@end
