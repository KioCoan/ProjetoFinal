//
//  AnimaOperadores.m
//  ProjetoFinal
//
//  Created by Felipe Costa Nascimento on 08/07/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "AnimaOperadores.h"

@implementation AnimaOperadores

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        sprites = [[NSMutableArray alloc] init];
        
        //ADICIONA UM OPERADOR NO CANTO SUPERIOR ESQUERDO DA TELA
        CGPoint position = CGPointMake(190, 400);
        [self criarOperador:position];
        
        //ADICIONA UM OPERADOR NO CANTO INFERIOR ESQUERDO DA TELA
        position = CGPointMake(190, 100);
        [self criarOperador:position];
        
        //ADICIONA UM OPERADOR NO CANTO SUPERIOR DIREITO DA TELA
        position = CGPointMake(580, 400);
        [self criarOperador: position];
        
        //ADICIONA UM OPERADOR NO CANTO INFERIOR DIREITO DA TELA
        position = CGPointMake(580, 100);
        [self criarOperador:position];
        
        //GERA VALORES ALEATORIOS PARA OS SPRITES
        [self atualizarValores];
        
        //CRIA A LABEL QUE ATUALIZA OS VALORES DOS SPRITES
        [self criarLabelAtualizar];
        
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}

-(void)criarOperador:(CGPoint)posicao{
    
    SpriteOperadorNode *spriteOperador = [[SpriteOperadorNode alloc] init];
    [spriteOperador setPosition:posicao];
    
    [sprites addObject:spriteOperador];
    
    [self addChild:spriteOperador];
}


-(void)criarLabelAtualizar{
    SKSpriteNode *atualizar = [[SKSpriteNode alloc] initWithImageNamed:@"atualizar-dados.png"];
    [atualizar setName:@"atualizar"];
    [atualizar setSize:CGSizeMake(80, 80)];
    [atualizar setPosition:CGPointMake(384, 300)];
    
    [self addChild:atualizar];
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint posicao = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:posicao];
    
    if([node.name isEqualToString:@"atualizar"]){
        [self atualizarValores];
    }
}

-(void)atualizarValores{
    Geral *calculadora = [[Geral alloc] init];
    NSString *valor1, *operador, *valor2, *resultado;
    int aux;
    
    for(int i=0; i<sprites.count; i++){
        aux = arc4random() % 200;
        
        //CASO O VALOR SEJA MENOR QUE 50, ELE É COSIDERADO COMO UM VALOR LÓGICO
        if(aux < 50){
            valor1 = [self valorLogicoAleatorio];
            operador = [self operadorLogicoAleatorio];
            valor2 = [self valorLogicoAleatorio];
            resultado = [calculadora calculaOperador:operador numero1:valor1 numero2:valor2];
            
        }else{
            valor1 = [self valorAleatorio];
            operador = [calculadora getOperador:[self operadorAleatorio]];
            valor2 = [self valorAleatorio];
            resultado = [calculadora calculaOperador:operador numero1:valor1 numero2:valor2];
        }
        
        //DEFINE OS NOVOS VALORES PARA O SPRITE DESSE INDEX
        [[sprites objectAtIndex:i] setLabelValor1:valor1 operador:operador valor2:valor2 resultado:resultado];
    }
    
}


-(NSString*)valorAleatorio{
    float num = arc4random() % 1000 + 2;
    num *= 0.9;
    
    if ((floorf(num)==(num))) {
        return  [NSString stringWithFormat:@"%.0f",num];
    }else{
        return [NSString stringWithFormat:@"%.02f", num];
    }
}


-(int)operadorAleatorio{
    return arc4random() % 10;
}


-(NSString*)operadorLogicoAleatorio{
    int operador = arc4random() % 2;
    
    switch (operador) {
        case 1:
            return @"&&";
            
        default:
            return @"||";
    }
}

-(NSString*)valorLogicoAleatorio{
    int num = arc4random() % 2;
    
    switch (num) {
        case 1:
            return @"Verdadeiro";
            
        default:
            return @"Falso";
    }
}

@end
