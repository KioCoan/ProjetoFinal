//
//  DesafioOperadoresNode.m
//  ProjetoFinal
//
//  Created by RAFAEL APARECIDO DE FREITAS on 18/09/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "DesafioOperadoresNode.h"

@implementation DesafioOperadoresNode

-(id)init{
    self = [super init];
    if (self) {
        gerenciadorDesafios = [GerenciadorDesafios sharedGerenciador];
        gerador = [[Gerador alloc]init];
        lblParte1 = [[SKLabelNode alloc] initWithFontNamed:FONT_THIN];
        lblParte2 = [[SKLabelNode alloc] initWithFontNamed:FONT_THIN];
        lblOperador = [[SKLabelNode alloc] initWithFontNamed:FONT_THIN];
        btn1 = [[BotaoDesafiosNode alloc] init];
        btn2 = [[BotaoDesafiosNode alloc] init];
        desafioAtual = [gerenciadorDesafios retornaTarefasParaDesafio];
    }
    
    return self;
}



-(void)alterarValores{
    if ([desafioAtual incrementaTarefa]) {
        lblParte1.text = [desafioAtual parte1];
        lblOperador.text = @"?";
        lblParte2.text = [desafioAtual parte2];
        lblResultado.text = [desafioAtual resultado];
        
        //        if ([self.desafioAtual respostaDupla]) {
        //            NSLog(@"Dupla");
        //        }
    }else{
        NSLog(@"Fim");
        
    }
}


-(void)ajustarBotoes{
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
