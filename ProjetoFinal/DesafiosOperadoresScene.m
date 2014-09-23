//
//  DesafiosOperadoresScene.m
//  ProjetoFinal
//
//  Created by RAFAEL APARECIDO DE FREITAS on 18/09/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "DesafiosOperadoresScene.h"

@implementation DesafiosOperadoresScene

{
    GerenciadorDesafios *gerenciadorDesafios;
    BotaoDesafiosNode *btn1, *btn2;
}

-(id)init{
    
    if (self = [super init]) {
        
        gerenciadorDesafios = [GerenciadorDesafios sharedGerenciador];
        gerador = [[Gerador alloc] init];
        desafioAtual = [[Desafio alloc] init];
        
        desafioAtual = [gerenciadorDesafios retornaTarefasParaDesafio];
        
        lblParte1 = [[SKLabelNode alloc] initWithFontNamed:FONT_THIN];
        lblParte2 = [[SKLabelNode alloc] initWithFontNamed:FONT_THIN];
        lblResultado = [[SKLabelNode alloc] initWithFontNamed:FONT_THIN];
        
        UIColor *cor = [UIColor colorWithRed:(76.0/255.0) green:(95.0/255.0) blue:(138.0/255.0) alpha:1];
        //UIColor *cor2 = [UIColor colorWithHue:<#(CGFloat)#> saturation:<#(CGFloat)#> brightness:<#(CGFloat)#> alpha:<#(CGFloat)#>]
        [lblParte1 setFontColor:cor];
        [lblParte2 setFontColor:cor];
        [lblResultado setFontColor:cor];
        
        [lblParte1 setHorizontalAlignmentMode:SKLabelHorizontalAlignmentModeRight];
        [lblParte2 setHorizontalAlignmentMode:SKLabelHorizontalAlignmentModeLeft];
        [lblResultado setHorizontalAlignmentMode:SKLabelHorizontalAlignmentModeCenter];
        
        
        btn1 = [[BotaoDesafiosNode alloc] init];
        btn2 = [[BotaoDesafiosNode alloc] init];
        fundo = [[SKSpriteNode alloc] initWithImageNamed:@"Desafio-Operadores-Fundo.png"];
        
        [btn1 setTexture:[SKTexture textureWithImageNamed:@"Desafio-Operadores-btn1.png"]];
        [btn2 setTexture:[SKTexture textureWithImageNamed:@"Desafio-Operadores-btn2.png"]];
        
        
        
        [fundo setPosition:CGPointMake(384, 512)];
        [lblParte1 setPosition:CGPointMake(300, 600)];
        [lblParte2 setPosition:CGPointMake(450, 600)];
        [lblResultado setPosition:CGPointMake(250, 500)];
        
        
        
        [self addChild:fundo];
        [self addChild:lblParte1];
        [self addChild:lblParte2];
        [self addChild:lblResultado];
        [self addChild:btn1];
        [self addChild:btn2];
        
        
        
        
        
        
        [self alteraTarefa];
        NSLog(@"%@",lblParte1.text);
    }
    
    return self;
}


-(void)corrige:(NSString*)opcao{
    
    
    NSLog(@"%d",[gerenciadorDesafios corrige:opcao]);
    //[self alteraValores];
    
}


-(void)alteraTarefa{
    
    if ([desafioAtual incrementaTarefa]) {
        lblParte1.text = [desafioAtual parte1];
        lblParte2.text = [desafioAtual parte2];
        lblResultado.text = [desafioAtual resultado];
        [self ajustaBotoes];
        //        if ([self.desafioAtual respostaDupla]) {
        //            NSLog(@"Dupla");
        //        }
    }else{
        NSLog(@"Fim");
    }
    
}

-(void)ajustaBotoes{
    int aleatorio = arc4random() % 2;
    if (aleatorio == 1) {
        [btn1 setValor:[desafioAtual operador]];
        [btn2 setValor:[gerador retornaOperadorInverso:[desafioAtual operador]]];
    }else{
        [btn2 setValor:[desafioAtual operador]];
        [btn1 setValor:[gerador retornaOperadorInverso:[desafioAtual operador]]];
    }
    
}

@end
