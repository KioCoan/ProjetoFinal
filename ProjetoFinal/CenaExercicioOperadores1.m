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
    NSString *valor1;
    NSString *valor2;
    NSString *resultado;
    SpriteLabelNode *operador;
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
        
        
        //allocando calculador
        calculador = [[Calculador alloc]init];
        
        opcoes = [NSMutableArray array];
        expressoes = [NSMutableArray array];
        
        
            [self geraDadosAleatorio];
            [self criaSpriteOperador];
        
        opcoes = [self embaralha:opcoes];
        [self posicionamento:opcoes];
        
        
        //coloca na tela
        [self criaEnunciado];
        //[self adicionaNaTela];
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
    
    CGPoint posicaoInicial = CGPointMake(50, 100);
    CGPoint posicaoMutavel = posicaoInicial;
    
    posicaoMutavel.x = posicaoInicial.x + 10;
    posicaoMutavel.x = self.frame.size.width * 80;
    
    for (SpriteLabelNode *labelOperador in vetor) {
        [labelOperador setPosition:posicaoMutavel];
        [labelOperador setPosicaoInicial:posicaoMutavel];
        posicaoMutavel.x += (labelOperador.fontSize * 2);
        [self addChild:labelOperador];
    }
    
    
    
    
}

- (void)geraDadosAleatorio{
    
    int n = 0;
    //sorteia operacao
    
    n = arc4random() % operadores.count;
    operador = [[SpriteLabelNode alloc]initWithType:@"operador" texto:[operadores objectAtIndex:n]];
    operador.name = @"labelOperador";
    operador.fontSize = 65;
    [opcoes addObject:operador];
    
    //sorteia valor
    
    n = arc4random() % 10 + 1;
    valor1 = [NSString stringWithFormat:@"%d",n];
    
    n = arc4random() % 10 + 1;
    
    valor2 = [NSString stringWithFormat:@"%d",n];
    
    
       //chamando o calculador para retornar o resultado da operacao
    
    NSString *aux = [calculador calculaOperador:operador.text numero1:valor1 numero2:valor2];
    
    //NSArray *strings = [[NSArray alloc]initWithObjects:@"=",aux ,nil];
    //resultado = [[SpriteLabelNode alloc]initWithType:@"resultado" texto:[strings componentsJoinedByString:@" "]];
    resultado = aux;
    }

- (void)criaSpriteOperador{
   
    CGPoint posicaoInicial = CGPointMake(200, 650);
    CGPoint posicaoMutavel = posicaoInicial;
    
    
    for (int i = 0; i < 6; i++) {
        
        
        [self geraDadosAleatorio];
        
        
        SpriteOperadorNode *spriteOperador = [[SpriteOperadorNode alloc]init];
        [spriteOperador setLabelValor1:valor1];
        [spriteOperador setLabelValor2:valor2];
        [spriteOperador setLabelResultado:resultado];
        spriteOperador.name = @"sprite";
        
        
        
        spriteOperador.position = posicaoMutavel;
        
        
        
        [expressoes addObject:spriteOperador];
        
        [self addChild:spriteOperador];
        
        
        
        
        
        if (((i+1) % 2) != 0) {
            posicaoMutavel.x = 550;
        }else{
            posicaoMutavel.x = posicaoInicial.x;
            posicaoMutavel.y -= 200;
        }
        
        
    }
    
    
    
}




- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    //criando toque e posicao
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode* teste = [self nodeAtPoint:location];
    
    if ([teste.name isEqualToString:@"labelOperador"]) {
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
    
    
    
    if ([conteudoAtivo.name isEqualToString:@"labelOperador"] && conteudoAtivo) {
        
        conteudoAtivo.dentro = NO;
        
        for (SpriteOperadorNode *spriteOperador in expressoes) { //Ao soltar o node de resposta em algum lugar varre o vetor de caixas para descobrir sobre quem está
            
            
            valor1 = [spriteOperador getValor1];
            valor2 = [spriteOperador getValor2];
            resultado = [spriteOperador getResultado];
            
            
            //COORDENADAS PARA A CAIXA
            OperadorNode *teste = [spriteOperador retornaOperadorNode];
            float xInicio = teste.frame.origin.x;
            float width = teste.size.width;
            float xFim = xInicio + teste.frame.size.width;
            float xMeio = (xInicio + xFim)/2;
            float yInicio = teste.frame.origin.y;
            float yFim = yInicio + teste.frame.size.height;
            float heith = teste.size.height;
            float yMeio = (yInicio + yFim)/2;
            
            
            //verifica se o nó movido esta dentro das coordenadas da caixa
            
            if ((conteudoAtivo.position.x > xInicio && conteudoAtivo.position.x < xFim)&&(conteudoAtivo.position.y >yInicio && conteudoAtivo.position.y < yFim)) { // Verifica se o nó "resposta" está sobre alguma caixa
                
                
                
                    //primeiro verifica se ja existe algum o operador na caixa
                
                    //CHAMA O CALCULADOR E SE A EXPRESSAO ESTA CORRETA
                    
                    if (![self operadorNasCordenadasX:xMeio Y:yMeio]  && [resultado isEqualToString:[calculador calculaOperador:conteudoAtivo.text numero1:valor1 numero2:valor2]]) { //se a resposta do calculador for a mesma da expressao
                        [conteudoAtivo setPosition:CGPointMake(xMeio, yMeio)]; //Coloca o node no centro da caixa
                        NSLog(@"funcionou");
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
            //NSLog(@"esta faltando operador");
            return;
        }
        
        
    }
    
    
    //NSLog(@"exercicio concluido");
    [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"ExeOperadores1"];
    [self.myDelegate exercicioFinalizado];
    
}
@end
