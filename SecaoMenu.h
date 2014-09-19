//
//  SecaoMenu.h
//  ProjetoFinal
//
//  Created by Henrique Pereira de Lima on 16/09/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "IconeSecao.h"


@protocol SecaoMenuDelegate <NSObject>

- (void)fuiClicado:(NSString*)tipo;

@end

@interface SecaoMenu : SKSpriteNode

@property id<SecaoMenuDelegate> myDelegate;

@property NSString *titulo;
@property NSMutableArray *icones;

- (IconeSecao *)criarIconeSecao :(NSString *)titulo tipo:(NSString *)tipo posicao:(CGPoint)posicao;
- (IconeSecao *)criarIconeSecao :(NSString *)titulo tipo:(NSString *)tipo imagem:(NSString *)imagem;

- (id)init;
    
    





@end
