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
    BOOL move;
    
    
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
        opcoes = [self embaralha:opcoes];
        [self posicionamento:opcoes];
        
        
        //coloca na tela
        [self criaEnunciado];
        [self adicionaNaTela];
        _corretos = 0;
    }
    return self;

    
}



- (void)criaEnunciado{
    
    SKLabelNode *enunciado1 = [[SKLabelNode alloc]initWithFontNamed:@"HeadLine"];
    SKLabelNode *enunciado2 = [[SKLabelNode alloc]initWithFontNamed:@"HeadLine"];
    
    
    CGPoint posicao = CGPointMake(400, 850);
    CGPoint posicao2 = posicao;
    posicao2.y -= enunciado1.fontSize * 1.2 ;
    
    NSString *texto1 = @"Arraste cada operador para";
    NSString *texto2 = @"dentro da caixa adequada";
    
    [enunciado1 setText:texto1];
    [enunciado2 setText:texto2];
    [enunciado1 setPosition:posicao];
    [enunciado2 setPosition:posicao2];
    
    [self addChild:enunciado1];
    [self addChild:enunciado2];
    
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


- (void)posicionamento:(NSMutableArray *)vetor{
    
    posicaoMutavel.x = posicaoInicial.x + 10;
    //posicaoMutavel.x = self.frame.size.width * 700;
    for (SpriteLabelNode *aux in vetor) {
        [aux setPosition:posicaoMutavel];
        [aux setPosicaoInicial:posicaoMutavel];
        posicaoMutavel.x += (aux.fontSize * 2);
    }
    
    
    
    
}

- (void)geraDadosAleatorio{
    
    int n = 0;
    //sorteia operacao
    
    n = arc4random() % operadores.count;
    operador = [[SpriteLabelNode alloc]initWithType:@"operador" texto:[operadores objectAtIndex:n]];
    operador.name = @"operador";
    
    //sorteia valor
    
    n = arc4random() % 10 + 1;
    valor1 = [[SpriteLabelNode alloc]initWithType:@"valor" texto:[NSString stringWithFormat:@"%d",n]];
    valor1.name = @"valor";
    
    n = arc4random() % 10 + 1;
    
    valor2 = [[SpriteLabelNode alloc]initWithType:@"valor" texto:[NSString stringWithFormat:@"%d",n]];
    valor2.name = @"valor";
    
    
    //alocando espaco vazio
    
    espaco = [SKSpriteNode spriteNodeWithImageNamed:@"fundo-cinza.png"];
    espaco.name = @"espaco";
    //chamando o calculador para retornar o resultado da operacao
    
    NSString *aux = [calculador calculaOperador:operador.text numero1:valor1.text numero2:valor2.text];
    //NSArray *strings = [[NSArray alloc]initWithObjects:@"=",aux ,nil];
    //resultado = [[SpriteLabelNode alloc]initWithType:@"resultado" texto:[strings componentsJoinedByString:@" "]];
    resultado = [[SpriteLabelNode alloc]initWithType:@"resultado" texto:aux];
    resultado.name = @"resultado";
    atribuicao = [[SpriteLabelNode alloc]initWithType:@"atribuicao" texto:@"="];
    atribuicao.name = @"atribuicao";
}


- (void)criaExpressoes{
    
    
    //Criando vetor
    
    
    //preparando tamanho das fontes
    
    
    
    //atribuindo tamanhos os objetos
   int font = self.frame.size.height * 40;
    valor1.fontSize = font;
    valor2.fontSize = font;
    resultado.fontSize = font;
    operador.fontSize = 65;
    atribuicao.fontSize = font;
    espaco.size = CGSizeMake(self.frame.size.width * 100, self.frame.size.height * 70);
    
    //trocando cor operador
    operador.fontColor = [UIColor greenColor];
    
    
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
    
    //ADICIONA NOZ NA TELA
    
    //ADICIONA AS EXPRESSOES NA TELA
    
    for (int i = 0; i < expressoes.count; i++) {
        [self addChild:[[expressoes objectAtIndex:i] valueForKey:@"valor1"]];
        [self addChild:[[expressoes objectAtIndex:i] valueForKey:@"valor2"]];
        [self addChild:[[expressoes objectAtIndex:i] valueForKey:@"espaco"]];
        [self addChild:[[expressoes objectAtIndex:i] valueForKey:@"atribuicao"]];
        [self addChild:[[expressoes objectAtIndex:i] valueForKey:@"resultado"]];
    }
    
    //ADICIONA OS OPERADORES NA TELA
    
    for (int i = 0; i < opcoes.count; i++) {
        [self addChild:[opcoes objectAtIndex:i]];
    }
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    //criando toque e posicao
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode* teste = [self nodeAtPoint:location];
    
    if ([teste.name isEqualToString:@"operador"]) {
        conteudoAtivo = (SpriteLabelNode *) [self nodeAtPoint:location];
        move = YES;
    }
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    //se move estiver YES entao pode mover o NODE
    
    if (move) {
        
        //identificando toque e posicao
        UITouch *touch = [touches anyObject];
        CGPoint location = [touch locationInNode:self];
        
        //setando posicao no NODE
            [conteudoAtivo setPosition:location];
            
       
    }
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    
    
    if (conteudoAtivo) {
        
        conteudoAtivo.dentro = NO;
        
        for (NSDictionary *dict in expressoes) { //Ao soltar o node de resposta em algum lugar varre o vetor de caixas para descobrir sobre quem está
            
            espaco = [dict valueForKey:@"espaco"];
            valor1 = [dict valueForKey:@"valor1"];
            valor2 = [dict valueForKey:@"valor2"];
            resultado = [dict valueForKey:@"resultado"];
            
            
            //COORDENADAS PARA A CAIXA
            
            float xInicio = espaco.frame.origin.x;
            float xFim = xInicio + espaco.frame.size.width;
            float xMeio = (xInicio + xFim)/2;
            float yInicio = espaco.frame.origin.y;
            float yFim = yInicio + espaco.frame.size.height;
            float yMeio = (yInicio + yFim)/2;
            
            
            //verifica se o nó movido esta dentro de alguma caixa
            
            if ((conteudoAtivo.position.x > xInicio && conteudoAtivo.position.x < xFim)&&(conteudoAtivo.position.y >yInicio && conteudoAtivo.position.y < yFim)) { // Verifica se o nó "resposta" está sobre alguma caixa
                
                
                
                    //primeiro verifica se ja existe algum o operador na caixa
                
                    //CHAMA O CALCULADOR E SE A EXPRESSAO ESTA CORRETA
                    
                    if (![self operadorNasCordenadasX:xMeio Y:yMeio]  && [resultado.text isEqualToString:[calculador calculaOperador:conteudoAtivo.text numero1:valor1.text numero2:valor2.text]]) { //se a resposta do calculador for a mesma da expressao
                        [conteudoAtivo setPosition:CGPointMake(xMeio, yMeio)]; //Coloca o node no centro da caixa
                        conteudoAtivo.dentro = YES;
                        _corretos++;
                        [self corrigirExercicio];
                        
                    }else{
                        [self animacaoOperadorErrado];                    }

                
            }

    
        }
        
        
    }
    
    
    move = NO;
    
}



- (void)animacaoOperadorErrado{
    
    
    //DEIXA A LABEL VERMELHA E A COLOCA NA SUA COORDENADA DE INICIO
    
    
    
    conteudoAtivo.fontColor = [UIColor redColor];
    SKAction *animacaoVoltar = [SKAction moveTo:conteudoAtivo.posicaoInicial duration:0.5];
    [conteudoAtivo runAction:animacaoVoltar completion:^{
        [conteudoAtivo removeAllActions];
        conteudoAtivo.fontColor = [UIColor greenColor];
    }];

}



-(BOOL)operadorNasCordenadasX : (float)x Y: (float)y{
    
    
    //ESSE METODO É O QUE VERIFICA SE JA EXISTE UM OPERADOR NA DETERMINADA COORDENADA QUE SEMPRE SERA A COORDENADA CENTRAL DE UMA CAIXA
    
    
    for (SpriteLabelNode *op in opcoes) {
        if (op.position.x == x && op.position.y == y ) {
            return YES;
        }
        
    }
    return NO;
    
}

-(void)corrigirExercicio{
    
    for (SpriteLabelNode *op in opcoes) {
        
        
        if (!op.dentro) {
            NSLog(@"esta faltando operador");
            return;
        }
        
        
    }
    
    
    NSLog(@"exercicio concluido");
    [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"ExeOperadores1"];
    
}
@end
