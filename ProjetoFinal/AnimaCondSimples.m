//
//  AnimaCondSimples.m
//  ProjetoFinal
//
//  Created by Felipe Costa Nascimento on 26/07/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "AnimaCondSimples.h"


@implementation AnimaCondSimples

-(id)init{
    if(self = [super init]){
        
        [self inicializarClasse];
    }
    
    return self;
}


-(void)inicializarClasse{
    [self inicializaCondicaoNode];
    [self setBackgroundColor:[UIColor whiteColor]];
    //DEFINE OS VALORES, OPERADOR E RESULTADO
    Gerador *gerador = [[Gerador alloc] init];
    
    
    NSString* v1 = [NSString stringWithFormat:@"%d",[gerador retornaInteiro:0 ate:10]];
    NSString* v2 = [NSString stringWithFormat:@"%d",[gerador retornaInteiro:0 ate:10]];
    NSString* operador = [gerador retornaOperadorRelacional];
    [condicaoNode criarValores:v1 eOperador:operador eValor2:v2 resultado:@"Hello World"];
    
}


-(void)inicializaCondicaoNode{
    //CRIA UMA CONDIÇÃO DO TIPO "SE"
    condicaoNode = [[SpriteCondicaoNode alloc] initWithType:@"se"];
    [condicaoNode setPosition:CGPointMake(400, 400)];
    
    [self addChild:condicaoNode];

}

-(void)inicializarOperadores{
    
}

-(void)inicializarlabels{
    CGPoint posicoes = CGPointMake(500, 540);
    
    nota1 = [self criarLabelComTexto:@"nota1 <-" tipo:@"float" posicao:posicoes];
    [self addChild:nota1];
    
    posicoes.y -= 35;
    nota2 = [self criarLabelComTexto:@"nota2 <-" tipo:@"float" posicao:posicoes];
    [self addChild:nota2];
    
    posicoes.y -= 35;
    media = [self criarLabelComTexto:@"media <- (nota1 + nota2) / 2" tipo:@"float" posicao:posicoes];
    [self addChild:media];
}


-(SpriteLabelNode*)criarLabelComTexto:(NSString*)texto tipo:(NSString*)tipo posicao:(CGPoint)posicao{
    SpriteLabelNode *novoLabel = [[SpriteLabelNode alloc] initWithType:tipo texto:texto];
    [novoLabel setFontName:@"Helvetica"];
    [novoLabel setPosition:posicao];
    [novoLabel setFontSize:18];
    [novoLabel showTipo];
    [novoLabel setName:@"teste"];
    [novoLabel setFontColor:[SKColor blackColor]];
    [novoLabel setHorizontalAlignmentMode:SKLabelHorizontalAlignmentModeLeft];
    
    return novoLabel;
}


-(void)didMoveToView:(SKView *)view{
    CGRect frame = CGRectMake(450, 75, 120, 30);
    frame.origin.x += frame.size.width + 20;
    int numLabels = 2;
    
    for(int i=0; i<numLabels; i++){
        [self criarTextField:frame texto:@"5"];
        
        frame.origin.y -= 35;
    }
    
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint posicao = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:posicao];
    
    if([node.name isEqualToString:@"teste"]){
        
    }
}



-(void)criarTextField:(CGRect)frame texto:(NSString*)texto{
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.textColor = [UIColor blackColor];
    textField.font = [UIFont systemFontOfSize:17.0];
    textField.backgroundColor = [SKColor whiteColor];
    textField.autocorrectionType = UITextAutocorrectionTypeYes;
    textField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.delegate = self;
    textField.text = texto;
    
    
    [self.view addSubview:textField];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];

    return YES;
}

@end
