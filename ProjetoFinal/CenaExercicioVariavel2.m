//
//  CenaExercicioVariavel2.m
//  ProjetoFinal
//
//  Created by Henrique Pereira de Lima on 12/08/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "CenaExercicioVariavel2.h"

@implementation CenaExercicioVariavel2{
    SpriteCaixaNode *variavel;
    SKNode *conteudoAtivo;
    UITextField *textField;
    NSMutableArray *resposta;
    SKLabelNode *enunciado;
    SpriteLabelNode *labelCriada;
}

- (id)init{
    self = [super init];
    
    if (self) {
        
        [self criaVariavel];
        [self criaBotoes];
        
        [self criaEnunciado];
        
        
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
    
    
    
    
    textField = [[UITextField alloc] initWithFrame:CGRectMake(self.size.width * 0.6, self.size.height * 0.10, 250, 40)];
    //UITextField *testando = [UITextField alloc]initWithFrame:CGREctM
    //textField.center = self.view.center;
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.textColor = [UIColor blackColor];
    textField.font = [UIFont systemFontOfSize:25.0];
    textField.placeholder = @"Enter your name here";
    textField.backgroundColor = [UIColor whiteColor];
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    textField.keyboardType = UIKeyboardTypeDefault;
    textField.returnKeyType = UIReturnKeyDone;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    textField.clearsContextBeforeDrawing = YES;
    textField.delegate = self;
    textField.hidden = YES;
    [self.view addSubview:textField];
    
    
}




- (void)criaEnunciado{
    
    
    
    
    resposta = [[NSMutableArray alloc]init];
    Gerador *gerador = [[Gerador alloc]init];
    
    for (int i = 0; i < 4; i++) {
        [resposta addObject:[self retornaTextoIndice:i Gerador:gerador]];
    }
    
    
    
    enunciado = [[SKLabelNode alloc] initWithFontNamed:@"Helvetica"];
    enunciado.fontSize = 40;
    enunciado.text = [resposta componentsJoinedByString:@" "];
    enunciado.position = CGPointMake(50, 800);
    [enunciado setHorizontalAlignmentMode:SKLabelHorizontalAlignmentModeLeft];
    
    [self addChild:enunciado];
    
    
    
    
}

- (NSString *)retornaTextoIndice :(int)i Gerador:(Gerador *)gerador{
    
    
    
    switch (i) {
        case 0:
            return [gerador retornaTipoVariavel];
            break;
            
        case 1:
            return [gerador retornaNomeVariavel:[resposta objectAtIndex:i-i]];
            break;
            
            
        case 2:
            return @"<-";
            break;
            
        case 3:
           
            if ([[resposta objectAtIndex:i-i]isEqualToString:@"inteiro"]) {
                
                
                return [gerador retornaValorInteiro:1 ate:100];
            }else if ([[resposta objectAtIndex:i-i]isEqualToString:@"real"]){
                
                
                return [gerador retornaValorFloat:1 ate:1000];
                
                
            }else if ([[resposta objectAtIndex:i-i]isEqualToString:@"caractere"]){
                
                return [gerador retornaValorCaractere];
                
            }else{
                return [gerador retornaValorLogico];
            }
            
            break;
        default:
            
            return nil;
            break;
    }
    
    
    
}

- (void)criaBotoes{
    
    
    float font = 40;
    
    
   SpriteLabelNode *botaoConteudo = [[SpriteLabelNode alloc]initWithType:@"CONTEUDO" texto:@"Cont"];
    botaoConteudo.fontSize = font;
    botaoConteudo.name = @"botaoLabel";
    botaoConteudo.position = CGPointMake(200, 80);
    [self addChild:botaoConteudo];
    
    
    SpriteLabelNode *botaoTipo = [[SpriteLabelNode alloc]initWithType:@"TIPO" texto:@"Tipo"];
    botaoTipo.fontSize = font;
    botaoTipo.name = @"botaoLabel";
    botaoTipo.position = CGPointMake(font * 10, 80);
    [self addChild:botaoTipo];
    
    
    SpriteLabelNode *botaoNome = [[SpriteLabelNode alloc]initWithType:@"NOME" texto:@"Nome"];
    botaoNome.fontSize = font;
    botaoNome.name = @"botaoLabel";
    botaoNome.position = CGPointMake(font * 15, 80);
    [self addChild:botaoNome];
    
    
}





- (void)criaVariavel{
    
    variavel = [[SpriteCaixaNode alloc]init];
    [variavel setPosition:CGPointMake(400  , 500)];
    
    variavel.name = @"caixa";
    variavel.myDelegate = self;
    [variavel iniciarAnimacaoIntroducao];
    [self addChild:variavel];
    
}

- (void)criaLabelTipo : (NSString*)tipo{
    
    labelCriada = [[SpriteLabelNode alloc]initWithType:tipo texto:tipo];
    labelCriada.fontSize = 60;
    labelCriada.name = @"label";
    labelCriada.position = CGPointMake(400, 200);
    [self addChild:labelCriada];
    
}



- (void)spriteCaixaClicado:(SKSpriteNode *)spriteCaixa{
    SpriteCaixaNode *caixa = (SpriteCaixaNode *)spriteCaixa;
    [caixa executaSprite];
}

- (BOOL)textFieldShouldReturn:(UITextField*)testando{
    
    [testando resignFirstResponder];
    if ([conteudoAtivo.name isEqualToString:@"label"]) {
        
        SpriteLabelNode *label = (SpriteLabelNode *)conteudoAtivo;
        label.text = textField.text;
        
        [self limpaTextField];
        
        
    }
    
    
    return NO;
    
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
        [textField setHidden:NO];
    }
    
    
    
}


- (void)limpaTextField{
    
    [textField resignFirstResponder];
    
    textField.text = nil;
    textField.hidden = YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    //[self textFieldShouldReturn:textField];
    
    [self limpaTextField];
    
    UITouch *touch = [touches anyObject];
    CGPoint location =  [touch locationInNode:self];
    conteudoAtivo = [self nodeAtPoint:location];
    
    if ([conteudoAtivo.name isEqualToString:@"botaoLabel"] && labelCriada == nil) {
        
        SpriteLabelNode *aux = (SpriteLabelNode *)conteudoAtivo;
        
        
        [self criaLabelTipo:aux.tipo];
        
        
        
    }
    
    
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    
    if ([conteudoAtivo.name isEqualToString:@"label"]) {
        conteudoAtivo.position = location;
    }else{
        conteudoAtivo = nil;
    }
    
    
    //SE A POSIÇÃO QUE FOI CLICADA É A MESMA DO SPRITE DA CAIXA, O SPRITE É MOVIDO
    
}







@end
