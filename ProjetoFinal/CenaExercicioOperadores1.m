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
    NSMutableArray *opcoes;
    Calculador *calculador;
    CGPoint posicaoInicial;
    CGPoint posicaoMutavel;
    SpriteLabelNode *valor1;
    SpriteLabelNode *valor2;
    SpriteLabelNode *resultado;
    SpriteLabelNode *operador;
    SKSpriteNode *espaco;
    SpriteLabelNode *atribuicao;
    SpriteLabelNode *conteudoAtivo;
    
    
}




- (id)init{
    
    self = [super init];
    
    if (self) {
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        //criando vetor de operadores
        operadores = [NSArray arrayWithObjects:@">", @"<",@"==",@"!=",@">=",@"<=",@"+",@"-",@"*",@"/",nil];
        
        //setando principais configuracoes de posicionamento
        posicaoInicial = CGPointMake(self.frame.size.width * 60, self.frame.size.height * 700);
        posicaoMutavel = posicaoInicial;
        
        
        
        //allocando calculador
        calculador = [[Calculador alloc]init];
        
        opcoes = [NSMutableArray array];
        expressoes = [NSMutableArray array];
        
        for (int i = 0; i < 6; i++) {
            [self geraDadosAleatorio];
            [self criaExpressoes];
        }
        
        
        
        //[self criarExpressoes];
        [self posicionamento:opcoes];
        
        [self adicionaNaTela];
        
    }
    return self;

    
}


- (void)posicionamento:(NSMutableArray *)vetor{
    
    posicaoMutavel.x = posicaoInicial.x + 10;
    //posicaoMutavel.x = self.frame.size.width * 700;
    for (SpriteLabelNode *aux in vetor) {
        [aux setPosition:posicaoMutavel];
        posicaoMutavel.x += (aux.fontSize * 3);
    }
    
    
    
    
}

- (void)geraDadosAleatorio{
    
    int n = 0;
    //sorteia operacao
    
    n = arc4random() % operadores.count;
    operador = [[SpriteLabelNode alloc]initWithType:@"operador" texto:[operadores objectAtIndex:n]];
    
    
    //sorteia valor
    
    n = arc4random() % 10 + 1;
    valor1 = [[SpriteLabelNode alloc]initWithType:@"valor" texto:[NSString stringWithFormat:@"%d",n]];
    
    n = arc4random() % 10 + 1;
    
    valor2 = [[SpriteLabelNode alloc]initWithType:@"valor" texto:[NSString stringWithFormat:@"%d",n]];
    
    
    
    //alocando espaco vazio
    
    espaco = [SKSpriteNode spriteNodeWithImageNamed:@"fundo-cinza.png"];
    
    //chamando o calculador para retornar o resultado da operacao
    
    NSString *aux = [calculador.geral calculaOperador:operador.text numero1:valor1.text numero2:valor2.text];
    //NSArray *strings = [[NSArray alloc]initWithObjects:@"=",aux ,nil];
    //resultado = [[SpriteLabelNode alloc]initWithType:@"resultado" texto:[strings componentsJoinedByString:@" "]];
 resultado = [[SpriteLabelNode alloc]initWithType:@"resultado" texto:aux];
    atribuicao = [[SpriteLabelNode alloc]initWithType:@"atribuicao" texto:@"="];
}


- (void)criaExpressoes{
    
    
    //Criando vetor
    
    
    //preparando tamanho das fontes
    
    
    
    //atribuindo tamanhos os objetos
   int font = self.frame.size.height * 40;
    valor1.fontSize = font;
    valor2.fontSize = font;
    resultado.fontSize = font;
    operador.fontSize = font;
    atribuicao.fontSize = font;
    espaco.size = CGSizeMake(self.frame.size.width * 100, self.frame.size.height * 70);
    
    
    
    
    //setando posicao dos objetos
    float margem = 15;
    
    valor1.position = posicaoMutavel;
    posicaoMutavel.x += valor1.fontSize * 3;
    posicaoMutavel.y += margem;
    
    espaco.position = posicaoMutavel;
    posicaoMutavel.x += espaco.size.width * 1.0;
    posicaoMutavel.y -= margem;
    
    
    valor2.position = posicaoMutavel;
    posicaoMutavel.x += valor2.fontSize * 2;
    
    atribuicao.position = posicaoMutavel;
    
    
    
    if ([resultado.text isEqualToString:@"Verdadeiro"]) {
        posicaoMutavel.x += atribuicao.fontSize * 4;
    }else if ([resultado.text isEqualToString:@"falso"]){
        posicaoMutavel.x += atribuicao.fontSize * 3;
    }else{
        posicaoMutavel.x += atribuicao.fontSize * 2;
    }
    
    resultado.position = posicaoMutavel;
    
    posicaoMutavel.x = posicaoInicial.x;
    posicaoMutavel.y -= espaco.size.height * 1.5;
    
    //criando NSDictionary
    
    
    NSDictionary *dict = @{@"valor1": valor1,
                           @"valor2":valor2,
                           @"espaco":espaco,
                           @"atribuicao":atribuicao,
                           @"resultado":resultado
                           };

    
    [expressoes addObject:dict];
    [opcoes addObject:operador];

}

- (void)adicionaNaTela{
    
    
    for (int i = 0; i < expressoes.count; i++) {
        [self addChild:[[expressoes objectAtIndex:i] valueForKey:@"valor1"]];
        [self addChild:[[expressoes objectAtIndex:i] valueForKey:@"valor2"]];
        [self addChild:[[expressoes objectAtIndex:i] valueForKey:@"espaco"]];
        [self addChild:[[expressoes objectAtIndex:i] valueForKey:@"atribuicao"]];
        [self addChild:[[expressoes objectAtIndex:i] valueForKey:@"resultado"]];
    }
    
    for (int i = 0; i < opcoes.count; i++) {
        [self addChild:[opcoes objectAtIndex:i]];
    }
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    
    UITouch *touch = [touches anyObject];
    
    
    CGPoint location = [touch locationInNode:self];
    conteudoAtivo = (SpriteLabelNode *) [self nodeAtPoint:location];
    
}
@end
