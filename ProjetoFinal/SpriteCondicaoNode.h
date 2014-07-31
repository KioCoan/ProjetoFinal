//
//  SpriteCondicaoNode.h
//  ProjetoFinal
//
//  Created by Felipe Costa Nascimento on 25/07/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "SpriteOperadorNode.h"


@interface SpriteCondicaoNode : SKSpriteNode
{
    SpriteOperadorNode *operadorSe;
    SpriteOperadorNode *operadorSenaoSe;
}

-(void)criarCondicaoSe:(NSString*)valor1 operador:(NSString*)operador valor2:(NSString*)valor2;
-(void)criarCondicaoSenaoSe:(NSString*)valor1 operador:(NSString*)operador valor2:(NSString*)valor2;
-(void)iniciarAnimacao;

@end
