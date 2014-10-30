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

@protocol SessaoMenuDelegate <NSObject>

- (void)sessaoAtivada:(NSString*)tipo;

@end




@interface SessaoMenu : SKSpriteNode



@property NSMutableArray *tiposIcones;
@property id<SessaoMenuDelegate> myDelegate;
@property NSString *titulo;
@property NSMutableArray *iconesProntos;


- (NSMutableArray *)retornaIcones;
- (id)init;
- (NSMutableArray *)criarTodosIcones;
- (int)retornaNumeroIcones;
- (NSMutableArray *)retornaInfoIcones;
- (void)adicionaIcone:(UIImageView *)icone;
- (NSDictionary *)retornaDictionaryPorIndice:(int)indice;
    
    





@end
