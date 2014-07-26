//
//  ResultadoCondicaoNode.h
//  ProjetoFinal
//
//  Created by Felipe Costa Nascimento on 26/07/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "SpriteCaixaNode.h"
 

@interface ResultadoCondicaoNode : SKSpriteNode
{
    SpriteCaixaNode *caixa;
}
-(id)initWithVariavel:(NSString*)nome tipo:(NSString*)tipo conteudo:(NSString*)conteudo;
@end
