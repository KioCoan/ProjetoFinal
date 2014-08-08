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
    [self setBackgroundColor:[SKColor whiteColor]];
    contadorDeTeste = 0;
    [self inicializarBotaoIniciarAnimacao];
    
    condicoesNode = [[NSMutableArray alloc] init];
    
    [condicoesNode addObject:[self inicializaCondicaoNode:@"se" posicao:CGPointMake(130, 450)]];
    //[condicoesNode addObject:[self inicializaCondicaoNode:@"senao" posicao:CGPointMake(130, 270)]];
    
    [self inicializarParametros];
    
}


//PERCORRE O VETOR DE SpriteCondicaoNode DEFININDO OS VALORES ALEATÓRIOS
-(void)inicializarParametros{
    for(SpriteCondicaoNode* node in condicoesNode){
        //DEFINE OS VALORES, OPERADOR E RESULTADO
        Gerador *gerador = [[Gerador alloc] init];
        
        NSString* v1 = [NSString stringWithFormat:@"%d",[gerador retornaInteiro:0 ate:10]];
        NSString* v2 = [NSString stringWithFormat:@"%d",[gerador retornaInteiro:0 ate:10]];
        NSString* operador = [gerador retornaOperadorRelacional];
        
        [node criarValores:v1 eOperador:operador eValor2:v2 resultado:@"Verdade!!!"];
        [self inicializaSaidadeDados];
        
        // Teste remover depois
        if ([node retornaVeracidade]) {
            [console exibeTexto:[node retornaTextoASerExibido]];
        }
    }
}

-(void)inicializaSaidadeDados{
    console = [[SaidaDeDados alloc] init];
    [console setPosition:CGPointMake(594, 83)];
    [self addChild:console];
    //[console exibeTexto:@">"];
    
}

-(SpriteCondicaoNode*)inicializaCondicaoNode:(NSString*)tipo posicao:(CGPoint)posicao{
    
    SpriteCondicaoNode *condicaoNode = [[SpriteCondicaoNode alloc] initWithType:tipo];
    [condicaoNode setPosition:posicao];
    condicaoNode.myDelegate = self;
    [self addChild:condicaoNode];
    
    return condicaoNode;

}

-(void)inicializarBotaoIniciarAnimacao{
    botaoIniciarTeste = [SKSpriteNode spriteNodeWithImageNamed:@"atualizar-dados.png"];
    [botaoIniciarTeste setSize:CGSizeMake(40, 40)];
    [botaoIniciarTeste setPosition:CGPointMake(100, 100)];
    [botaoIniciarTeste setName:@"iniciarAnimacao"];
    
    [self addChild:botaoIniciarTeste];
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


//-(void)didMoveToView:(SKView *)view{
//    CGRect frame = CGRectMake(450, 75, 120, 30);
//    frame.origin.x += frame.size.width + 20;
//    int numLabels = 2;
//    
//    for(int i=0; i<numLabels; i++){
//        [self criarTextField:frame texto:@"5"];
//        
//        frame.origin.y -= 35;
//    }
//    
//}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint posicao = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:posicao];
    
    if([node.name isEqualToString:@"iniciarAnimacao"]){
        [node removeFromParent];
        [[condicoesNode objectAtIndex:contadorDeTeste] iniciarTeste];
    }
}


-(void)testeFinalizado:(BOOL)verdadeiro{
    if(!verdadeiro && contadorDeTeste < condicoesNode.count - 1){
        [[condicoesNode objectAtIndex:++contadorDeTeste] iniciarTeste];
    
    }else{
        [self addChild:botaoIniciarTeste];
        contadorDeTeste = 0;
    }
    
}

//-(void)criarTextField:(CGRect)frame texto:(NSString*)texto{
//    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
//    textField.borderStyle = UITextBorderStyleRoundedRect;
//    textField.textColor = [UIColor blackColor];
//    textField.font = [UIFont systemFontOfSize:17.0];
//    textField.backgroundColor = [SKColor whiteColor];
//    textField.autocorrectionType = UITextAutocorrectionTypeYes;
//    textField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
//    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
//    textField.delegate = self;
//    textField.text = texto;
//    
//    
//    [self.view addSubview:textField];
//}

//-(BOOL)textFieldShouldReturn:(UITextField *)textField{
//    [textField resignFirstResponder];
//
//    return YES;
//}

@end
