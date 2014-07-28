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
    
    SKLabelNode *lblCodigo1;
    SpriteLabelNode *condicao;
    expressoes = [NSMutableArray array];
    float altura = self.frame.size.height * 770;
    
    
    //linha 1
    
    //editando texto
    n = arc4random() % 10;
    lblCodigo1 = [SKLabelNode labelNodeWithFontNamed:@"Helvetica"];
    lblCodigo1.text = [NSString stringWithFormat:@"n <- %d",n];
    lblCodigo1.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    
    condicao = [[SpriteLabelNode alloc]init];
    
    //editando tamanho e posicao
    
    lblCodigo1.position = CGPointMake(self.frame.size.width * 50, altura);;
    lblCodigo1.fontSize = font;
    
    //salvando e aadicionado linha
    [self salvaExpressoes:condicao texto:lblCodigo1];
    [self addChild:lblCodigo1];
    condicao = nil;
    altura -= 40;
    
    
    //linha 2
    
    //editando texto
    
    lblCodigo1 = [SKLabelNode labelNodeWithFontNamed:@"Helvetica"];
    lblCodigo1.text = @"se(          )";
    lblCodigo1.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    
    condicao = [[SpriteLabelNode alloc]initWithType:@"se" texto:@"n < 3"];
    condicao.fontName = @"Helvetica";
    condicao.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    
    //editando posicao
    
    lblCodigo1.position = CGPointMake(self.frame.size.width * 50, altura);;
    lblCodigo1.fontSize = font;
    NSLog(@"tamanho tela %f",self.frame.size.width * 50);
    
    condicao.position = CGPointMake(self.frame.size.width * 90, altura);
    condicao.posicaoInicial = condicao.position;
    condicao.fontSize = font;
    
    //adicionando e salvando linha
    [self salvaExpressoes:condicao texto:lblCodigo1];
    [self addChild:lblCodigo1];
    [self addChild:condicao];
    
    //preparando para proxima linha
    lblCodigo1 = nil;
    condicao = nil;
    altura -= 40;
    
    
    //linha 3
    
    lblCodigo1 = [SKLabelNode labelNodeWithFontNamed:@"Helvetica"];
    lblCodigo1.text = @"escreva (vou ao parque);";
    lblCodigo1.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    
    condicao = [[SpriteLabelNode alloc]init];
    
    //editando posicionamento e font
    
    lblCodigo1.position = CGPointMake(self.frame.size.width * 80, altura);;
    lblCodigo1.fontSize = font;
    
    //salvando e adicionando linha
    
    [self salvaExpressoes:condicao texto:lblCodigo1];
    [self addChild:lblCodigo1];
    altura -= 40;
    
    //linha 4
    
    //editando texto
    
    lblCodigo1 = [SKLabelNode labelNodeWithFontNamed:@"Helvetica"];
    lblCodigo1.text = @"}senao se (          ){";
    lblCodigo1.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    
    condicao = [[SpriteLabelNode alloc]initWithType:@"se" texto:@"n < 6"];
    condicao.fontName = @"Helvetica";
    condicao.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    
    //editando posicionamento e font
    
    lblCodigo1.position = CGPointMake(self.frame.size.width * 50, altura);;
    lblCodigo1.fontSize = font;
    
    condicao.position = CGPointMake(self.frame.size.width * 180, altura);
    condicao.fontSize = font;
    
    //salvando e adicionando linha
    
    [self salvaExpressoes:condicao texto:lblCodigo1];
    [self addChild:lblCodigo1];
    [self addChild:condicao];
    altura -= 40;

    //linha 5
    
    
    lblCodigo1 = [SKLabelNode labelNodeWithFontNamed:@"Helvetica"];
    lblCodigo1.text = @"escreva (vou para o cinema);";
    lblCodigo1.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    
    condicao = [[SpriteLabelNode alloc]init];
    
    //editando posicionamento e font
    
    lblCodigo1.position = CGPointMake(self.frame.size.width * 80, altura);;
    lblCodigo1.fontSize = font;
    
    
    //salvando e adicionando linha
    
    [self salvaExpressoes:condicao texto:lblCodigo1];
    [self addChild:lblCodigo1];
    altura -= 40;

    
    //codigo 6
    
    //editando texto
    
    lblCodigo1 = [SKLabelNode labelNodeWithFontNamed:@"Helvetica"];
    lblCodigo1.text = @"}senao{";
    lblCodigo1.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    
    condicao = [[SpriteLabelNode alloc]init];
    
    
    //editando posicionamento e font
    
    lblCodigo1.position = CGPointMake(self.frame.size.width * 50, altura);;
    lblCodigo1.fontSize = font;
    
    
    //salvando e adicionando linha
    
    [self salvaExpressoes:condicao texto:lblCodigo1];
    [self addChild:lblCodigo1];
    altura -= 40;
    

 
    //codigo 7
    
    lblCodigo1 = [SKLabelNode labelNodeWithFontNamed:@"Helvetica"];
    lblCodigo1.text = @"escreva(ficarei em casa);";
    lblCodigo1.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    
    condicao = [[SpriteLabelNode alloc]init];
    
    //editando posicionamento e font
    
    lblCodigo1.position = CGPointMake(self.frame.size.width * 80, altura);;
    lblCodigo1.fontSize = font;
    
    
    //salvando e adicionando linha
    
    [self salvaExpressoes:condicao texto:lblCodigo1];
    [self addChild:lblCodigo1];
    altura -= 40;

    //codigo 8
    
    lblCodigo1 = [SKLabelNode labelNodeWithFontNamed:@"Helvetica"];
    lblCodigo1.text = @"}";
    lblCodigo1.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    
    condicao = [[SpriteLabelNode alloc]init];
    
    //editando posicionamento e font
    
    lblCodigo1.position = CGPointMake(self.frame.size.width * 50, altura);;
    lblCodigo1.fontSize = font;
    
    
    //salvando e adicionando linha
    
    [self salvaExpressoes:condicao texto:lblCodigo1];
    [self addChild:lblCodigo1];
    altura -= 40;


    
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

-(void)salvaExpressoes:(SpriteLabelNode*)condicao texto:(SKLabelNode *)texto{
    
    NSDictionary *linha = @{
                           @"condicao":condicao,
                           @"texto":texto
                           };
    
    [expressoes addObject:linha];
}

- (NSMutableArray *)embaralha :(NSMutableArray *)antigo{
    
    int n1;
    NSMutableArray *vetorEmbaralhado = [NSMutableArray array];
    
    while (antigo.count > 0) {
        n1 = arc4random() % antigo.count;
        
        [vetorEmbaralhado addObject:[antigo objectAtIndex:n1]];
        [antigo removeObjectAtIndex:n1];
    }
    
    
    
    
    return vetorEmbaralhado;
    
    
    
}




@end
