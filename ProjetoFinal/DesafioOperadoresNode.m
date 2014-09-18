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
        parte1 = [[SKLabelNode alloc] initWithFontNamed:@"Colaborate-Thin"];
        parte2 = [[SKLabelNode alloc] initWithFontNamed:@"Colaborate-Thin"];
        operador = [[SKLabelNode alloc] initWithFontNamed:@"Colaborate-Thin"];
        btn1 = [[SKLabelNode alloc] initWithFontNamed:@"Colaborate-Thin"];
        btn2 = [[SKLabelNode alloc] initWithFontNamed:@"Colaborate-Thin"];
    }
    
    return self;
}



-(void)alteraValores{
    
}




@end
