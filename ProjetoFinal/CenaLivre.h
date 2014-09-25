//
//  CenaLivre.h
//  ProjetoFinal
//
//  Created by Henrique Pereira de Lima on 12/09/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import <UIKit/UIKit.h>

#import "SpriteCaixaNode.h"

@protocol CenaLivreDelegate <NSObject>

- (void)esconderNavigationController:(BOOL)esconder;

@end


@interface CenaLivre : SKScene <UITextFieldDelegate,CaixaPosicaoDelegate>

@property id<CenaLivreDelegate> myDelegate;


@end
