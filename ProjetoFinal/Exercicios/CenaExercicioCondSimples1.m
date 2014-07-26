//
//  CenaExercicioCondSimples1.m
//  ProjetoFinal
//
//  Created by Henrique Pereira de Lima on 21/07/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "CenaExercicioCondSimples1.h"

@implementation CenaExercicioCondSimples1
{
    NSMutableArray *expressoes;
    float font;
}

- (id)init{
    
    self = [super init];
    
    if (self) {
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        [self criaEnunciado];
        [self criaExpressoes];
    }
    return self;
    
    
}

- (void)criaEnunciado{
    

    
    NSString *texto1 = @"Assinale a alternativa Correta.";
    NSString *texto2 = @"O que será escrito na tela, segundo as seguintes instruções:";
    font = self.frame.size.height * 25;
    
    
    //Criando Label 1
    
        SKLabelNode *lblEnunciado1 = [SKLabelNode labelNodeWithFontNamed:@"Arial"];
        [lblEnunciado1 setText:texto1];
        lblEnunciado1.position = CGPointMake(self.frame.size.width * 230, self.frame.size.height * 900);
        lblEnunciado1.fontSize = font;
        [self addChild:lblEnunciado1];
    

    //Criando Label 2
    
    
    SKLabelNode *lblEnunciado2 = [SKLabelNode labelNodeWithFontNamed:@"Arial"];
    [lblEnunciado2 setText:texto2];
    lblEnunciado2.position = CGPointMake(self.frame.size.width * 400, self.frame.size.height * 850);
    lblEnunciado2.fontSize = font;
    [self addChild:lblEnunciado2];
    
    
}

- (void)criaExpressoes{
    
    
    expressoes = [NSMutableArray array];
    float altura = self.frame.size.height * 770;
    
    
    //codigo 1
    
    SpriteLabelNode *lblCodigo1 = [[SpriteLabelNode alloc]initWithType:@"codigo" texto:@"n <- ?"] ;
    
    lblCodigo1.position = CGPointMake(self.frame.size.width * 100, altura);;
    lblCodigo1.fontSize = font;
    altura -= 40;
    [expressoes addObject:lblCodigo1];
    [self addChild:lblCodigo1];
    
    //codigo 2
    
    SpriteLabelNode *lblCodigo2 = [[SpriteLabelNode alloc]initWithType:@"codigo" texto:@"se( n < 3){"] ;
    
    lblCodigo2.position = CGPointMake(self.frame.size.width * 126, altura);;
    lblCodigo2.fontSize = font;
    altura -= 40;
    [expressoes addObject:lblCodigo2];
    [self addChild:lblCodigo2];
    
    //codigo 3
    SpriteLabelNode *lblCodigo3 = [[SpriteLabelNode alloc]initWithType:@"codigo" texto:@"escreva (vou ao parque);"] ;
    
    lblCodigo3.position = CGPointMake(self.frame.size.width * 280, altura);;
    lblCodigo3.fontSize = font;
    altura -= 40;
    [expressoes addObject:lblCodigo3];
    [self addChild:lblCodigo3];
    
    
    //codigo 4
    SpriteLabelNode *lblCodigo4 = [[SpriteLabelNode alloc]initWithType:@"codigo" texto:@"}senao se ( n < 6){"] ;
    
    lblCodigo4.position = CGPointMake(self.frame.size.width * 187, altura);;
    lblCodigo4.fontSize = font;
    altura -= 40;
    [expressoes addObject:lblCodigo4];
    [self addChild:lblCodigo4];
    
    //codigo 5
    SpriteLabelNode *lblCodigo5 = [[SpriteLabelNode alloc]initWithType:@"codigo" texto:@"escreva (vou para o cinema);"] ;
    
    lblCodigo5.position = CGPointMake(self.frame.size.width * 318, altura);;
    lblCodigo5.fontSize = font;
    altura -= 40;
    [expressoes addObject:lblCodigo5];
    [self addChild:lblCodigo5];
    
    
    //codigo 6
    SpriteLabelNode *lblCodigo6 = [[SpriteLabelNode alloc]initWithType:@"codigo" texto:@"}senao{"] ;
    
    lblCodigo6.position = CGPointMake(self.frame.size.width * 105, altura);;
    lblCodigo6.fontSize = font;
    altura -= 40;
    [expressoes addObject:lblCodigo6];
    [self addChild:lblCodigo6];

 
    //codigo 7
    SpriteLabelNode *lblCodigo7 = [[SpriteLabelNode alloc]initWithType:@"codigo" texto:@"escreva(ficarei em casa);"] ;
    
    lblCodigo7.position = CGPointMake(self.frame.size.width * 294, altura);;
    lblCodigo7.fontSize = font;
    altura -= 40;
    [expressoes addObject:lblCodigo7];
    [self addChild:lblCodigo7];

    //codigo 8
    SpriteLabelNode *lblCodigo8 = [[SpriteLabelNode alloc]initWithType:@"codigo" texto:@"}"] ;
    
    lblCodigo8.position = CGPointMake(self.frame.size.width * 57, altura);;
    lblCodigo8.fontSize = font;
    altura -= 40;
    [expressoes addObject:lblCodigo8];
    [self addChild:lblCodigo8];

    
}

- (void)criaAlternativas{

    
    SpriteLabelNode *alternativa1 = [[SpriteLabelNode alloc]initWithType:@"seila" texto:@"vou ao parque"];
    SpriteLabelNode *alternativa2 = [[SpriteLabelNode alloc]initWithType:@"seila" texto:@"vou para o cinema"];
    SpriteLabelNode *alternativa3 = [[SpriteLabelNode alloc]initWithType:@"seila" texto:@"ficarei em casa"];
    SpriteLabelNode *alternativa4 = [[SpriteLabelNode alloc]initWithType:@"seila" texto:@"todas alternativas"];
    
    //setando tamanho fonte
    alternativa1.fontSize = font;
    alternativa2.fontSize = font;
    alternativa3.fontSize = font;
    alternativa4.fontSize = font;
    
}



@end
