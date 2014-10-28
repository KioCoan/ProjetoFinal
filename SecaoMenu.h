//
//  SecaoMenu.h
//  ProjetoFinal
//
//  Created by Henrique Pereira de Lima on 16/09/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "IconeSecao.h"
#import "IconeView.h"

@protocol SecaoMenuDelegate <NSObject>

- (void)fuiClicado:(NSString*)tipo;

@end




@interface SecaoMenu : SKSpriteNode{
    NSMutableArray *icones;
}


@property id<SecaoMenuDelegate> myDelegate;

@property NSString *titulo; 



- (IconeSecao *)criarIconeSecao :(NSString *)titulo tipo:(NSString *)tipo posicao:(CGPoint)posicao;
- (IconeSecao *)criarIconeSecao :(NSString *)titulo tipo:(NSString *)tipo imagem:(NSString *)imagem;
- (IconeSecao *)retornaIconeIndice:(int)indice;
- (int)retornaNumeroIcones;
- (void)removeTodosIcones;
- (id)init;
- (void)criarTodosIcones;
- (IconeView *)criaIconeSecaoImagem:(NSString *)imagem;
- (UIImageView *)retornaIconeIndice2:(int)indice;
- (void)removeTodosIcones2;

    
    





@end
