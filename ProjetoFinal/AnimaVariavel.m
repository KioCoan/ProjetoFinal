//
//  AnimaVariavel.m
//  ProjetoFinal
//
//  Created by Felipe Costa Nascimento on 04/07/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "AnimaVariavel.h"

@implementation AnimaVariavel

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        self.caixa = [[SKSpriteNode alloc] initWithImageNamed:@"abrir-caixa1.png"];
        self.caixa.size = CGSizeMake(307, 328);
        self.caixa.position = CGPointMake(200, 300);
        self.caixa.name = @"caixa";
        
        [self addChild:self.caixa];
        
        [self setCaixaAberta:NO];
        [self inicializaAnimacaoAbrirCaixa];
        [self inicializaAnimacaoFecharCaixa];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    //É VERIFICADO SE A POSIÇÃO QUE FOI CLICADA É A MESMA DO SPRITE DA CAIXA E SE O USUARIO NAO ESTÁ MOVENDO A CAIXA
    if([node.name isEqualToString:@"caixa"] && !self.movendoCaixa){
        
        //É VERIFICADO COMO O SPRITE ESTÁ ATUALMENTE, CASO ESTEJA A CAIXA ABERTA É INCIADA A ANIMAÇÃO QUE FECHA A CAIXA OU ABRE A CAIXA
        if(self.caixaAberta){
            [self.caixa runAction:self.animacaoFechar completion:^{
                [self.caixa removeAllActions];
                [self setCaixaAberta:NO];
            }];
            
        }else{
            [self.caixa runAction:self.animacaoAbrir completion:^{
                [self.caixa removeAllActions];
                [self setCaixaAberta:YES];
            }];
        }
    }
    
    self.movendoCaixa = false;
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    //SE A POSIÇÃO QUE FOI CLICADA É A MESMA DO SPRITE DA CAIXA, O SPRITE É MOVIDO
    if([node.name isEqualToString:@"caixa"]){
        [self.caixa setPosition:location];
        
        
        self.movendoCaixa = true;
    }
}


-(void)inicializaAnimacaoAbrirCaixa{
    //CRIO TEXTURAS PARA TODAS OS SPRITES DA VARIAVEL
    SKTexture *caixa1 = [SKTexture textureWithImageNamed:@"abrir-caixa1.png"];
    SKTexture *caixa2 = [SKTexture textureWithImageNamed:@"abrir-caixa2.png"];
    SKTexture *caixa3 = [SKTexture textureWithImageNamed:@"abrir-caixa3.png"];
    SKTexture *caixa4 = [SKTexture textureWithImageNamed:@"abrir-caixa4.png"];
    SKTexture *caixa5 = [SKTexture textureWithImageNamed:@"abrir-caixa5.png"];
    SKTexture *caixa6 = [SKTexture textureWithImageNamed:@"abrir-caixa6.png"];
    SKTexture *caixa7 = [SKTexture textureWithImageNamed:@"abrir-caixa7.png"];
    SKTexture *caixa8 = [SKTexture textureWithImageNamed:@"abrir-caixa8.png"];
    SKTexture *caixa9 = [SKTexture textureWithImageNamed:@"abrir-caixa9.png"];
    SKTexture *caixa10 = [SKTexture textureWithImageNamed:@"abrir-caixa10.png"];
    SKTexture *caixa11 = [SKTexture textureWithImageNamed:@"abrir-caixa11.png"];
    SKTexture *caixa12 = [SKTexture textureWithImageNamed:@"abrir-caixa12.png"];
    SKTexture *caixa13 = [SKTexture textureWithImageNamed:@"abrir-caixa13.png"];
    
    NSArray *array = [NSArray arrayWithObjects:caixa1, caixa2, caixa3, caixa4, caixa5, caixa6, caixa7, caixa8, caixa9, caixa10, caixa11, caixa12, caixa13, nil];
    
    //INSTANCIO A SKACTION COM O ARRAY DE TEXTURAS CRIADO
    self.animacaoAbrir = [SKAction animateWithTextures:array timePerFrame:0.05];
}

-(void)inicializaAnimacaoFecharCaixa{
    //CRIO TEXTURAS PARA TODAS OS SPRITES DA VARIAVEL EM ORDEM INVERSA (CAIXA FECHANDO)
    SKTexture *caixa1 = [SKTexture textureWithImageNamed:@"abrir-caixa13.png"];
    SKTexture *caixa2 = [SKTexture textureWithImageNamed:@"abrir-caixa12.png"];
    SKTexture *caixa3 = [SKTexture textureWithImageNamed:@"abrir-caixa11.png"];
    SKTexture *caixa4 = [SKTexture textureWithImageNamed:@"abrir-caixa10.png"];
    SKTexture *caixa5 = [SKTexture textureWithImageNamed:@"abrir-caixa9.png"];
    SKTexture *caixa6 = [SKTexture textureWithImageNamed:@"abrir-caixa8.png"];
    SKTexture *caixa7 = [SKTexture textureWithImageNamed:@"abrir-caixa7.png"];
    SKTexture *caixa8 = [SKTexture textureWithImageNamed:@"abrir-caixa6.png"];
    SKTexture *caixa9 = [SKTexture textureWithImageNamed:@"abrir-caixa5.png"];
    SKTexture *caixa10 = [SKTexture textureWithImageNamed:@"abrir-caixa4.png"];
    SKTexture *caixa11 = [SKTexture textureWithImageNamed:@"abrir-caixa3.png"];
    SKTexture *caixa12 = [SKTexture textureWithImageNamed:@"abrir-caixa2.png"];
    SKTexture *caixa13 = [SKTexture textureWithImageNamed:@"abrir-caixa1.png"];
    
    NSArray *array = [NSArray arrayWithObjects:caixa1, caixa2, caixa3, caixa4, caixa5, caixa6, caixa7, caixa8, caixa9, caixa10, caixa11, caixa12, caixa13, nil];
    
    //INSTANCIO A SKACTION COM O ARRAY DE TEXTURAS CRIADO
    self.animacaoFechar = [SKAction animateWithTextures:array timePerFrame:0.05];
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
