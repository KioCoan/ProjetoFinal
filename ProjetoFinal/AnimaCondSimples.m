//
//  AnimaCondSimples.m
//  ProjetoFinal
//
//  Created by Felipe Costa Nascimento on 26/07/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "AnimaCondSimples.h"

@implementation AnimaCondSimples

-(id)init{
    if(self = [super init]){
        SpriteCondicaoNode *teste = [[SpriteCondicaoNode alloc] initWithTipoDeCondicao:SE_SENAO];
        [teste setPosition:CGPointMake(400, 300)];
        [self addChild:teste];
        [self inicializarlabels];
        [self setBackgroundColor:[SKColor whiteColor]];
    }
    
    return self;
}

-(void)inicializarlabels{
    CGPoint posicoes = CGPointMake(100, 540);
    
    nota1 = [self criarLabelComTexto:@"float nota1 <-" posicao:posicoes];
    [self addChild:nota1];
    
    posicoes.y -= 25;
    nota2 = [self criarLabelComTexto:@"float nota2 <-" posicao:posicoes];
    [self addChild:nota2];
    
    posicoes.y -= 25;
    media = [self criarLabelComTexto:@"float media <-" posicao:posicoes];
    [self addChild:media];
}

-(SKLabelNode*)criarLabelComTexto:(NSString*)texto posicao:(CGPoint)posicao{
    SKLabelNode *novoLabel = [[SKLabelNode alloc] initWithFontNamed:@"Helvetica"];
    [novoLabel setText:texto];
    [novoLabel setPosition:posicao];
    [novoLabel setFontSize:20];
    [novoLabel setFontColor:[SKColor blackColor]];
    [novoLabel setHorizontalAlignmentMode:SKLabelHorizontalAlignmentModeLeft];
    
    return novoLabel;
}


-(void)didMoveToView:(SKView *)view{
    //CHAMA O METODO QUE CRIA OS TEXT FIELD
}

-(void)criarTextField:(CGRect)frame texto:(NSString*)texto{
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    [textField setText:texto];
}

@end
