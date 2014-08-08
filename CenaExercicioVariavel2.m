//
//  CenaExercicioVariavel2.m
//  ProjetoFinal
//
//  Created by Henrique Pereira de Lima on 07/08/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "CenaExercicioVariavel2.h"

@implementation CenaExercicioVariavel2
{
    NSMutableArray *variaveis;
    SKSpriteNode *botaoCaixa;
    SpriteLabelNode *botaoConteudo;
    SpriteLabelNode *botaoTipo;
    SpriteLabelNode *botaoNome;
    SKNode *conteudoAtivo;
    int apertei;
    int soltei;
}

- (id)init{
    self = [super init];
    
    if (self) {
        
        
        variaveis = [NSMutableArray array];
        
        [self criaBotoes];
        
        
        
 
    }
    return self;
}


-(void)didMoveToView:(SKView *)view{
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressGestureRecognizer:)];
    //[longPress setMinimumPressDuration:1.5];
    //[longPress setNumberOfTouchesRequired:2];
    [longPress setNumberOfTouchesRequired:1];
    [longPress setMinimumPressDuration:2];
    [self.view addGestureRecognizer:longPress];
    
}

- (void)longPressGestureRecognizer:(UILongPressGestureRecognizer *)recognizer{
    
//    if (recognizer.state == UIGestureRecognizerStateBegan) {
//        NSLog(@"gesture comecou");
//    }else if (recognizer.state == UIGestureRecognizerStateChanged){
//        NSLog(@"gesture meio");
//    }else if (recognizer.state == UIGestureRecognizerStateEnded){
//        NSLog(@"gesture fim");
//    }
    
    
    
    if (recognizer.state == UIGestureRecognizerStateBegan && [conteudoAtivo.name isEqualToString:@"caixa"]) {
        NSLog(@"funcionou");
    }else if (recognizer.state == UIGestureRecognizerStateBegan && [conteudoAtivo.name isEqualToString:@"label"]){
        NSLog(@"funcionou novamnete");
    }
    
    
    
}



- (void)criaBotoes{
    
    
    botaoCaixa = [[SpriteCaixaNode alloc]initWithImageNamed:@"abrir-caixa1.png"];
    botaoCaixa.size = CGSizeMake(100, 100);
    botaoCaixa.position = CGPointMake(100, 100);
    botaoCaixa.name = @"botaoCaixa";
    [self addChild:botaoCaixa];
    
    
    
    botaoConteudo = [[SpriteLabelNode alloc]initWithType:@"conteudo" texto:@"Cont"];
    botaoConteudo.fontSize = 40;
    botaoConteudo.name = @"botaoConteudo";
    botaoConteudo.position = CGPointMake(250, 80);
    [self addChild:botaoConteudo];
    
    
    botaoTipo = [[SpriteLabelNode alloc]initWithType:@"tipo" texto:@"Tipo"];
    botaoTipo.fontSize = 40;
    botaoTipo.name = @"botaoTipo";
    botaoTipo.position = CGPointMake(430, 80);
    [self addChild:botaoTipo];
    
    
    botaoNome = [[SpriteLabelNode alloc]initWithType:@"nome" texto:@"Nome"];
    botaoNome.fontSize = 40;
    botaoNome.name = @"botaoNome";
    botaoNome.position = CGPointMake(600, 80);
    [self addChild:botaoNome];

    
}

- (void)criaVariavel{
    
    SpriteCaixaNode *caixa = [[SpriteCaixaNode alloc]initWithImageNamed:@"abrir-caixa1.png"];
    [caixa setPosition:botaoCaixa.position];
    caixa.name = @"caixa";
    caixa.size = CGSizeMake(200, 200);
    [variaveis addObject:caixa];
    [self addChild:caixa];
    
}


- (void)criaConteudo{
    
    SpriteLabelNode *conteudo = [[SpriteLabelNode alloc]initWithType:@"conteudo" texto:@"CONTEUDO"];
    conteudo.fontSize = 60;
    conteudo.name = @"label";
    conteudo.position = botaoConteudo.position;
    [self addChild:conteudo];
    
}

- (void)criarTipo{
    
    SpriteLabelNode *tipo = [[SpriteLabelNode alloc]initWithType:@"tipo" texto:@"TIPO"];
    tipo.fontSize = 60;
    tipo.name = @"label";
    tipo.position = botaoTipo.position;
    [self addChild:tipo];
}

- (void)criarNome{
    
    SpriteLabelNode *nome = [[SpriteLabelNode alloc]initWithType:@"nome" texto:@"NOME"];
    nome.fontSize = 60;
    nome.name = @"label";
    nome.position = botaoNome.position;
    [self addChild:nome];
    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    
    UITouch *touch = [touches anyObject];
    apertei =[touch timestamp];
//    NSLog(@"segurei %d segundos",apertei);
    CGPoint location =  [touch locationInNode:self];
    conteudoAtivo = [self nodeAtPoint:location];
    
        if ([conteudoAtivo.name isEqualToString:@"botaoCaixa"]) {
        
        
        [self criaVariavel];

    }else if ([conteudoAtivo.name isEqualToString:@"botaoConteudo"]){
        
        [self criaConteudo];
        
        
    }else if ([conteudoAtivo.name isEqualToString:@"botaoTipo"]){
        [self criarTipo];
        
    }else if ([conteudoAtivo.name isEqualToString:@"botaoNome"]){
        [self criarNome];
    }
    
    
    
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    
    if ([conteudoAtivo.name isEqualToString:@"caixa"] || [conteudoAtivo.name isEqualToString:@"label"]) {
        conteudoAtivo.position = location;
    }else{
        conteudoAtivo = nil;
    }
    
    
    //SE A POSIÇÃO QUE FOI CLICADA É A MESMA DO SPRITE DA CAIXA, O SPRITE É MOVIDO
    
    
    
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    soltei =[touch timestamp];
    //NSLog(@"soltei %d segundos",soltei);
    int conta = soltei - apertei;
    
    //NSLog(@"total %d",conta);
    
    
    
    
}
@end
