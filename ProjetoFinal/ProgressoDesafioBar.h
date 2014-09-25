//
//  ProgressoDesafioBar.h
//  ProjetoFinal
//
//  Created by Rafael Aparecido de Freitas on 25/09/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface ProgressoDesafioBar : SKSpriteNode
{
    NSMutableArray *bolinhas;
}

-(id)initWithBolinhas:(int)nBolinhas;

@end
