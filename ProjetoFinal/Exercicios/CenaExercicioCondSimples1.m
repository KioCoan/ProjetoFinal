//
//  CenaExercicioCondSimples1.m
//  ProjetoFinal
//
//  Created by Henrique Pereira de Lima on 21/07/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "CenaExercicioCondSimples1.h"
#import <stdlib.h>

@implementation CenaExercicioCondSimples1
{
    NSMutableArray *expressoes;
    NSMutableArray *alternativas;
    float font;
    int n;
}

- (id)init{
    
    self = [super init];
    
    if (self) {
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        font = self.frame.size.height * 25;
        
        
        [self criaEnunciado];
        [self criaExpressoes];
        [self criaAlternativas];
    }
    return self;
    
    
}

- (void)criaEnunciado{
    

    
    NSString *texto1 = @"Assinale a alternativa Correta.";
    NSString *texto2 = @"O que será escrito na tela, segundo as seguintes instruções:";
    
    
    
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
    int n = arc4random() % 10;
    
    //SpriteLabelNode *lblCodigo1 = [[SpriteLabelNode alloc]initWithType:@"codigo" texto:@"n <- ?"] ;
    SpriteLabelNode *lblCodigo1 = [[SpriteLabelNode alloc]initWithType:@"codigo" texto:[NSString stringWithFormat:@"n <- %d",n]];
    
    lblCodigo1.position = CGPointMake(self.frame.size.width * 100, altura);;
    lblCodigo1.fontSize = font;
    altura -= 40;
    [expressoes addObject:lblCodigo1];
    [self addChild:lblCodigo1];
    
    //codigo 2
    
    SpriteLabelNode *lblCodigo2 = [[SpriteLabelNode alloc]initWithType:@"condicional1" texto:@"se( n < 3){"] ;
    
    lblCodigo2.position = CGPointMake(self.frame.size.width * 126, altura);;
    lblCodigo2.fontSize = font;
    altura -= 40;
    [expressoes addObject:lblCodigo2];
    [self addChild:lblCodigo2];
    
    //codigo 3
    SpriteLabelNode *lblCodigo3 = [[SpriteLabelNode alloc]initWithType:@"resposta1" texto:@"escreva (vou ao parque);"] ;
    
    lblCodigo3.position = CGPointMake(self.frame.size.width * 280, altura);;
    lblCodigo3.fontSize = font;
    altura -= 40;
    [expressoes addObject:lblCodigo3];
    [self addChild:lblCodigo3];
    
    
    //codigo 4
    SpriteLabelNode *lblCodigo4 = [[SpriteLabelNode alloc]initWithType:@"condicional2" texto:@"}senao se ( n < 6){"] ;
    
    lblCodigo4.position = CGPointMake(self.frame.size.width * 187, altura);;
    lblCodigo4.fontSize = font;
    altura -= 40;
    [expressoes addObject:lblCodigo4];
    [self addChild:lblCodigo4];
    
    //codigo 5
    SpriteLabelNode *lblCodigo5 = [[SpriteLabelNode alloc]initWithType:@"resposta2" texto:@"escreva (vou para o cinema);"] ;
    
    lblCodigo5.position = CGPointMake(self.frame.size.width * 318, altura);;
    lblCodigo5.fontSize = font;
    altura -= 40;
    [expressoes addObject:lblCodigo5];
    [self addChild:lblCodigo5];
    
    
    //codigo 6
    SpriteLabelNode *lblCodigo6 = [[SpriteLabelNode alloc]initWithType:@"condicional3" texto:@"}senao{"] ;
    
    lblCodigo6.position = CGPointMake(self.frame.size.width * 105, altura);;
    lblCodigo6.fontSize = font;
    altura -= 40;
    [expressoes addObject:lblCodigo6];
    [self addChild:lblCodigo6];

 
    //codigo 7
    SpriteLabelNode *lblCodigo7 = [[SpriteLabelNode alloc]initWithType:@"resposta3" texto:@"escreva(ficarei em casa);"] ;
    
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
    
    int fontAlternativas = self.frame.size.height * 35;
    
    alternativas = [NSMutableArray array];

    CGPoint posiciaoInicial = CGPointMake(self.frame.size.width * 70, self.frame.size.height * 300);
    CGPoint posicaoMutavel = posiciaoInicial;
    
    NSMutableArray *textos = [NSMutableArray array];
    
    //textos das alternativas
    [textos addObject:@"vou ao parque"];
    [textos addObject:@"vou para o cinema"];
    [textos addObject:@"ficarei em casa"];
    [textos addObject:@"todas alternativas"];
    
    textos = [self embaralha:textos];
    
    
    
    
    //criando alternativas
    
    SpriteLabelNode *alternativaA = [[SpriteLabelNode alloc]initWithType:@"seila" texto:[NSString stringWithFormat:@"a. %@",[textos objectAtIndex:0]]];
    SpriteLabelNode *alternativaB = [[SpriteLabelNode alloc]initWithType:@"seila" texto:[NSString stringWithFormat:@"b. %@",[textos objectAtIndex:1]]];
    SpriteLabelNode *alternativaC = [[SpriteLabelNode alloc]initWithType:@"seila" texto:[NSString stringWithFormat:@"c. %@",[textos objectAtIndex:2]]];
    SpriteLabelNode *alternativaD = [[SpriteLabelNode alloc]initWithType:@"seila" texto:[NSString stringWithFormat:@"d. %@",[textos objectAtIndex:3]]];
    
    
    
    //colocando tamanho
    alternativaA.fontSize = fontAlternativas;
    alternativaB.fontSize = fontAlternativas;
    alternativaC.fontSize = fontAlternativas;
    alternativaD.fontSize = fontAlternativas;
    
    //inserindo no vetor
    
    [alternativas addObject:alternativaA];
    [alternativas addObject:alternativaB];
    [alternativas addObject:alternativaC];
    [alternativas addObject:alternativaD];
    
    
    
    for (SKLabelNode *aux in alternativas) {
        aux.position = posicaoMutavel;
        aux.fontName = @"Arial";
        aux.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
        posicaoMutavel.y -= 60;
        [self addChild:aux];
    }
    
    
    
}

- (NSMutableArray *)embaralha :(NSMutableArray *)antigo{
    
    int n;
    NSMutableArray *vetorEmbaralhado = [NSMutableArray array];
    
    while (antigo.count > 0) {
        n = arc4random() % antigo.count;
        
        [vetorEmbaralhado addObject:[antigo objectAtIndex:n]];
        [antigo removeObjectAtIndex:n];
    }
    
    
    
    
    return vetorEmbaralhado;
    
    
    
}




@end
