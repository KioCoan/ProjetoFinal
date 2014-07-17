//
//  CenaExercicioOperadores1.m
//  ProjetoFinal
//
//  Created by Henrique Pereira de Lima on 17/07/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "CenaExercicioOperadores1.h"
#import <stdlib.h>


@implementation CenaExercicioOperadores1{
    NSMutableArray *expressoes;
    NSArray *operadores;
    NSMutableArray *expressao;
    
}




- (id)init{
    
    self = [super init];
    
    if (self) {
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        
        operadores = [NSArray arrayWithObjects:@">", @"<",@"==",@"!=",@">=",@"<=",@"+",@"-",@"*",@"/",nil];
        [self expressoesAleatorias];
        
        //[self criarExpressoes];
        
        
        
    }
    return self;

    
}



- (void)expressoesAleatorias{
    
    
    expressao = [NSMutableArray array];
    int n = 0;
    
    //sorteia operacao
    
    n = arc4random() % operadores.count;
    [expressao addObject:[[SpriteLabelNode alloc] initWithType:@"operador" texto:[operadores objectAtIndex:n]]];
    //[expressao addObject:[operadores objectAtIndex:n]];
    
    
    //sorteia valor
    
    for (int i = 0; i < 2; i++) {
        
        n = arc4random() % 10 + 1;
        
        NSString *valor = [NSString stringWithFormat:@"%d",n];
        
        [expressao addObject:[[SpriteLabelNode alloc] initWithType:@"inteiro" texto:valor]];
        //[expressao addObject:valor];
        
    }
    
    for (int i = 0; i < expressao.count; i++) {
        NSLog(@"%@ ",[[expressao objectAtIndex:i] text]);
    }
    
    
    //chamar compilador e pegar o resultado
    
    
    
    
    
}


- (void)criarExpressoes{
    
    
    //Criando vetor
    expressoes = [NSMutableArray array];
    
    //preparando posiciao inicial e tamanhos dos objetos
    
    
    CGPoint posicaoInicial = CGPointMake(self.frame.size.width * 100, self.frame.size.height * 700);
    CGPoint posicaoVariavel = posicaoInicial;
    
    int font = self.frame.size.height * 40;
    
    // criando os nos
    
    SpriteLabelNode *n1 = [[SpriteLabelNode alloc]initWithType:@"inteiro" texto:@"2"];
    SpriteLabelNode *n2 = [[SpriteLabelNode alloc]initWithType:@"inteiro" texto:@"3"];
    SpriteLabelNode *n3 = [[SpriteLabelNode alloc]initWithType:@"inteiro" texto:@"= 5"];
    SKSpriteNode *espaco = [SKSpriteNode spriteNodeWithImageNamed:@"fundo-cinza.png"];
    
    
    
    //setando tamanho dos objetos
    
    n1.fontSize = font;
    n2.fontSize = font;
    n3.fontSize = font;
    espaco.size = CGSizeMake(self.frame.size.width * 100, self.frame.size.height * 70);
    
    //setando posicao dos objetos
    
    n1.position = posicaoVariavel;
    posicaoVariavel.x += n1.fontSize * 3;
    
    espaco.position = posicaoVariavel;
    posicaoVariavel.x += espaco.size.width * 1.0;
    
    n2.position = posicaoVariavel;
    posicaoVariavel.x += n2.fontSize * 2;
    
    n3.position = posicaoVariavel;
    
    //criando NSDictionary
    
    NSDictionary *dict = @{@"valor1": n1,@"espaco":espaco,@"valor2":n2,@"valor3":n3};
    
    [expressoes addObject:dict];
    
    
    
    
    
    [self addChild:[[expressoes objectAtIndex:0] valueForKey:@"valor1"]];
    [self addChild:[[expressoes objectAtIndex:0] valueForKey:@"espaco"]];
    [self addChild:[[expressoes objectAtIndex:0] valueForKey:@"valor2"]];
    [self addChild:[[expressoes objectAtIndex:0] valueForKey:@"valor3"]];
    
    
//    [self addChild:n1];
//    [self addChild:espaco];
//    [self addChild:n2];
//    [self addChild:n3];
    
}


@end
