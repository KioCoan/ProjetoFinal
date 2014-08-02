//
//  SpriteCondicaoNode.h
//  ProjetoFinal
//
//  Created by Felipe Costa Nascimento on 25/07/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "SpriteOperadorNode.h"
#import "Calculador.h"


@interface SpriteCondicaoNode : SKSpriteNode <SKPhysicsContactDelegate>
{
    SpriteOperadorNode *condicaoSe;
    SpriteOperadorNode *condicaoSenaoSe;
    NSString *condicaoCorreta;
    SKSpriteNode *bolinha;

}

-(void)criarCondicaoSe:(NSString*)valor1 operador:(NSString*)operador valor2:(NSString*)valor2;
-(void)criarCondicaoSenaoSe:(NSString*)valor1 operador:(NSString*)operador valor2:(NSString*)valor2;
-(NSString*)getCondicaoCorreta;
-(void)iniciarAnimacao;
-(void)iniciarTeste;
-(void)encerrarTeste;
-(void)removerCorpoSe;

@end
