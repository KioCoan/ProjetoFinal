//
//  AnimaCondSimples.h
//  ProjetoFinal
//
//  Created by Felipe Costa Nascimento on 26/07/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "SpriteCondicaoNode.h"
#import "Gerador.h"
#import "SaidaDeDados.h"

@interface AnimaCondSimples : SKScene <SpriteCondicaoNodeDelegate>
{
    NSMutableArray *condicoesNode;
    //SpriteCondicaoNode *condicaoNode;
    SKSpriteNode *botaoIniciarTeste;
    int contadorDeTeste;
    SaidaDeDados *console;

}


-(id)initWithCondicao:(NSString*)condicao;
@end
