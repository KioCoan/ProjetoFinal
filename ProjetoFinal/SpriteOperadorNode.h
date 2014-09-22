//
//  SpriteOperadorNode.h
//  testeSprite
//
//  Created by Felipe Costa Nascimento on 18/07/14.
//  Copyright (c) 2014 Felipe Costa Nascimento. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "OperadorNode.h"
#import "OperadorValoresNode.h"
#import "OperadorResultadoNode.h"
#import "MenuNode.h"

@interface SpriteOperadorNode : SKSpriteNode <OperadorNodeDelegate>
{
    OperadorNode *nodeOperador;
    OperadorValoresNode *nodeValores;
    OperadorResultadoNode *nodeResultado;
    
    SKAction *somOperador;
    
    BOOL partesVisiveis;
}

@property SKScene *dono;

-(id)initWithValor1:(NSString*)valor1 operador:(NSString*)operador valor2:(NSString*)valor2 resultado:(NSString*)resultado;
-(void)setLabelValor1:(NSString*)valor1 operador:(NSString*)operador valor2:(NSString*)valor2 resultado:(NSString*)resultado;
-(void)setLabelOperador:(NSString*)operador;
-(void)setLabelValor1:(NSString*)valor1;
-(void)setLabelValor2:(NSString*)valor2;
-(void)setLabelResultado:(NSString*)resultado;
-(NSString*)getValor1;
-(NSString*)getOperador;
-(NSString*)getValor2;
-(NSString *)getResultado;
-(OperadorNode*)retornaOperadorNode;
-(void)iniciarAnimacaoAbrir;
-(void)iniciarAnimacaoFechar;
-(BOOL)partesVisiveis;
@end
