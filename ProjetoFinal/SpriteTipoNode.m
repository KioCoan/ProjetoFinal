//
//  SpriteTipoNode.m
//  ProjetoFinal
//
//  Created by RAFAEL APARECIDO DE FREITAS on 06/08/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "SpriteTipoNode.h"

@implementation SpriteTipoNode


-(id)initWithValores:(NSString*)valor1 operador:(NSString*)operador valor2:(NSString*)valor2 resultado:(NSString*)resultado{
    self = [super init];
    
    if(self){
        
        spriteValores = [[OperadorValoresNode alloc] initWithValor1:valor1 valor2:valor2];
        
    }
    
    return self;
}

-(void)inicializaSpriteResultado:(NSString*)resultado{
    spriteResultado = [OperadorResultadoNode spriteNodeWithImageNamed:@"parte-resultado.png"];
    [spriteResultado setSize:CGSizeMake(227, 159)];
    [spriteResultado setLabelResultado:resultado];
    [[spriteResultado lblResultado] setFontSize:20];
    
    
}

@end
