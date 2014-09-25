//
//  ProgressoDesafioBar.m
//  ProjetoFinal
//
//  Created by Rafael Aparecido de Freitas on 25/09/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "ProgressoDesafioBar.h"

@implementation ProgressoDesafioBar


-(id)initWithBolinhas:(int)nBolinhas{
   
    self = [super init];
    
    if (self) {
        bolinhas = [[NSMutableArray alloc] init];
        CGFloat posY = 0;
        CGFloat posX = 17;
        
        for (int i=0; i<nBolinhas; i++) {
            [bolinhas addObject:[[SKSpriteNode alloc] initWithImageNamed:@"Desafio-Andamento-Vazio.png"]];
            [[bolinhas objectAtIndex:i]setPosition:CGPointMake(posX, posY)];
            posX +=50;
            [self addChild:[bolinhas objectAtIndex:i]];
        }
        [self setSize:CGSizeMake(posX-33, 33)];
    
    }
    return self;
}


@end
