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
    
}

- (id)init{
    self = [super init];
    
    if (self) {
        
        [self criaVariavel];
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
    
    
    
    
    
    
    
    
}

- (void)criaBotoes{
    
    
    float font = 40;
    
    
   SpriteLabelNode *botaoConteudo = [[SpriteLabelNode alloc]initWithType:@"conteudo" texto:@"Cont"];
    botaoConteudo.fontSize = font;
    botaoConteudo.name = @"botaoConteudo";
    botaoConteudo.position = CGPointMake(200, 80);
    [self addChild:botaoConteudo];
    
    
    SpriteLabelNode *botaoTipo = [[SpriteLabelNode alloc]initWithType:@"tipo" texto:@"Tipo"];
    botaoTipo.fontSize = font;
    botaoTipo.name = @"botaoTipo";
    botaoTipo.position = CGPointMake(font * 10, 80);
    [self addChild:botaoTipo];
    
    
    SpriteLabelNode *botaoNome = [[SpriteLabelNode alloc]initWithType:@"nome" texto:@"Nome"];
    botaoNome.fontSize = font;
    botaoNome.name = @"botaoNome";
    botaoNome.position = CGPointMake(font * 15, 80);
    [self addChild:botaoNome];
    
    
}





- (void)criaVariavel{
    
    variavel = [[SpriteCaixaNode alloc]init];
    [variavel setPosition:CGPointMake(400  , 500)];
    
    variavel.name = @"caixa";
    variavel.myDelegate = self;
    [self addChild:variavel];
    
}

- (void)criaConteudo{
    
    SpriteLabelNode *conteudo = [[SpriteLabelNode alloc]initWithType:@"conteudo" texto:@"CONTEUDO"];
    conteudo.fontSize = 60;
    conteudo.name = @"label";
    //conteudo.position = botaoConteudo.position;
    [self addChild:conteudo];
    
}

- (void)criarTipo{
    
    SpriteLabelNode *tipo = [[SpriteLabelNode alloc]initWithType:@"tipo" texto:@"TIPO"];
    tipo.fontSize = 60;
    tipo.name = @"label";
    //tipo.position = botaoTipo.position;
    [self addChild:tipo];
}

- (void)criarNome{
    
    SpriteLabelNode *nome = [[SpriteLabelNode alloc]initWithType:@"nome" texto:@"NOME"];
    nome.fontSize = 60;
    nome.name = @"label";
    //nome.position = botaoNome.position;
    [self addChild:nome];
    
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
    
    if ([conteudoAtivo.name isEqualToString:@"botaoConteudo"]) {
        
        
        [self criaConteudo];
        
    }else if ([conteudoAtivo.name isEqualToString:@"botaoConteudo"]){
        
        
        
        
    }else if ([conteudoAtivo.name isEqualToString:@"botaoTipo"]){
        [self criarTipo];
        
    }else if ([conteudoAtivo.name isEqualToString:@"botaoNome"]){
        [self criarNome];
    }else if ([conteudoAtivo.name isEqualToString:@"caixa"] && [touch tapCount] == 2){
        SpriteCaixaNode *c = (SpriteCaixaNode*) conteudoAtivo;
        [c executaSprite];
    }
    
    
    
}






@end
