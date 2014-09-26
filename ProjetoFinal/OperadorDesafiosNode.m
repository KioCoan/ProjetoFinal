//
//  OperadorDesafiosNode.m
//  ProjetoFinal
//
//  Created by Rafael Aparecido de Freitas on 24/09/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "OperadorDesafiosNode.h"
//#include "GerenciadorDesafios.h"

@implementation OperadorDesafiosNode

-(id)initWithImageNamed:(NSString *)name{
    
    self = [super initWithImageNamed:name];
    if (self) {
        valor = [[SKLabelNode alloc] initWithFontNamed:FONT_LIGHT];
        valor.fontSize = self.size.width / valor.frame.size.width + 20;
        [valor setHorizontalAlignmentMode:SKLabelHorizontalAlignmentModeCenter];
        [valor setVerticalAlignmentMode:SKLabelVerticalAlignmentModeCenter];
        [self addChild:valor];
        [self setSize:CGSizeMake(156.0, 156.0)];
        [valor setFontColor:[UIColor colorWithRed:(76.0/255.0) green:(95.0/255.0) blue:(138.0/255.0) alpha:1]];
        [self setValor:@"?"];
        
    }
    return self;
}

-(void)setValor:(NSString *)texto{
    [valor setText:texto];
    //valor.fontSize = self.size.width / valor.frame.size.width + 20;
    valor.fontSize = 90.0;
}

-(NSString*)getValor{
    return valor.text;
}


@end
