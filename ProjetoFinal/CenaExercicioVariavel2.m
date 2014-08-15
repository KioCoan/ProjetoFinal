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
    SKLabelNode *trechoEmPortugol;
    SKLabelNode *controlePasso;
    SKLabelNode *mensagemErro;
    SpriteLabelNode *labelCriada;
    int passo;
}

- (id)init{
    self = [super init];
    
    if (self) {
        
        [self criaVariavel];
        [self criaBotoes];
        [self criaEnunciado];
        
        [self reinicializaExercicio];
        
        
    }
    return self;
}



-(void)didMoveToView:(SKView *)view{
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressGestureRecognizer:)];
    //[longPress setMinimumPressDuration:1.5];
    //[longPress setNumberOfTouchesRequired:2];
    [longPress setNumberOfTouchesRequired:1];
    [longPress setMinimumPressDuration:1];
    [self.view addGestureRecognizer:longPress];
    
    
    
    textField = [[UITextField alloc] initWithFrame:CGRectMake(self.size.width * 0.6, self.size.height * 0.30, 250, 40)];
    //UITextField *testando = [UITextField alloc]initWithFrame:CGREctM
    //textField.center = self.view.center;
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.textColor = [UIColor blackColor];
    textField.font = [UIFont systemFontOfSize:25.0];
    textField.placeholder = @"Insira o valor";
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

-(void)criaMensagemErro{
    
    mensagemErro = [[SKLabelNode alloc]init];
    mensagemErro.position = CGPointMake(70, 750);
    [mensagemErro setHorizontalAlignmentMode:SKLabelHorizontalAlignmentModeLeft];
    mensagemErro.text = @"Existe algo errado na variável";
    mensagemErro.fontColor = [SKColor redColor];
    
    [self addChild:mensagemErro];
}


- (void)criandoPasso{
    
    controlePasso = [[SKLabelNode alloc]initWithFontNamed:@"Helvetica"];
    NSLog(@"criando label %d",passo);
    controlePasso.text = [NSString stringWithFormat:@"%d/3",passo];
    
    controlePasso.position = CGPointMake(700, 500);
    
    [self addChild:controlePasso];
    
}

- (void)criaEnunciado{
    
    SKLabelNode *enunciado = [[SKLabelNode alloc]init];
    enunciado.text = @"Monte as variáveis conforme o trecho a seguir:";
    enunciado.position = CGPointMake(50, 900);
    [enunciado setHorizontalAlignmentMode:SKLabelHorizontalAlignmentModeLeft];
    
    [self addChild:enunciado];
    
    
    
}

- (void)criaTrechoEmPortugol{
    
    
    
    
    if (passo > 3) {
        NSLog(@"acabou");
        return;
    }
    
    resposta = [[NSMutableArray alloc]init];
    Gerador *gerador = [[Gerador alloc]init];
    
    for (int i = 0; i < 4; i++) {
        [resposta addObject:[self retornaTextoIndice:i Gerador:gerador]];
    }
    
    
    
    trechoEmPortugol = [[SKLabelNode alloc] initWithFontNamed:@"Helvetica"];
    trechoEmPortugol.fontSize = 40;
    trechoEmPortugol.text = [resposta componentsJoinedByString:@" "];
    trechoEmPortugol.position = CGPointMake(50, 800);
    trechoEmPortugol.fontColor = [SKColor yellowColor];
    [trechoEmPortugol setHorizontalAlignmentMode:SKLabelHorizontalAlignmentModeLeft];
    NSLog(@"vai incrementar %d" ,passo);
    
    NSLog(@"ja incrementou %d",passo);
    [self addChild:trechoEmPortugol];
    
    
    
    
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
    
    
    
    SpriteLabelNode *botaoTipo = [[SpriteLabelNode alloc]initWithType:@"TIPO" texto:@"Tipo"];
    botaoTipo.fontSize = font;
    botaoTipo.name = @"botaoLabel";
    botaoTipo.position = CGPointMake(100, 80);
    [botaoTipo setHorizontalAlignmentMode:SKLabelHorizontalAlignmentModeLeft];
    [self addChild:botaoTipo];
    
    
    SpriteLabelNode *botaoNome = [[SpriteLabelNode alloc]initWithType:@"NOME" texto:@"Nome"];
    botaoNome.fontSize = font;
    botaoNome.name = @"botaoLabel";
    botaoNome.position = CGPointMake(botaoTipo.position.x + 200, 80);
    [botaoNome setHorizontalAlignmentMode:SKLabelHorizontalAlignmentModeLeft];
    [self addChild:botaoNome];
    
    
    
    SpriteLabelNode *botaoConteudo = [[SpriteLabelNode alloc]initWithType:@"CONTEUDO" texto:@"Conteudo"];
    botaoConteudo.fontSize = font;
    botaoConteudo.name = @"botaoLabel";
    botaoConteudo.position = CGPointMake(botaoNome.position.x + 300, 80);
    [botaoNome setHorizontalAlignmentMode:SKLabelHorizontalAlignmentModeLeft];
    [self addChild:botaoConteudo];

    
    
}





- (void)criaVariavel{
    
    variavel = [[SpriteCaixaNode alloc]init];
    [variavel setPosition:CGPointMake(400  , 500)];
    
    variavel.name = @"caixa";
    [variavel iniciarAnimacaoIntroducao];
    [self addChild:variavel];
    
}

- (void)criaLabelTipo : (NSString*)tipo{
    
    labelCriada = [[SpriteLabelNode alloc]initWithType:tipo texto:tipo];
    labelCriada.fontSize = 60;
    labelCriada.name = @"label";
    labelCriada.position = CGPointMake(400, 200);
    [self addChild:labelCriada];
    conteudoAtivo = labelCriada;
    
}


- (BOOL)textFieldShouldReturn:(UITextField*)testando{
    
    [testando resignFirstResponder];
    if ([conteudoAtivo.name isEqualToString:@"label"]) {
        
        SpriteLabelNode *label = (SpriteLabelNode *)conteudoAtivo;
        
        if ([label.tipo isEqualToString:@"TIPO"]) {
            
            
            if (![textField.text isEqualToString:@"caractere"] && ![textField.text isEqualToString:@"inteiro"] && ![textField.text isEqualToString:@"real"] && ![textField.text isEqualToString:@"logico"]) {
                
                
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ERRO"
                                                                message:@"TIPO DE VARIAVEL INEXISTENTE"
                                                               delegate:self
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles:nil];
                [alert show];
                
                
                return YES;
            }
            
            
        }
        
        label.text = textField.text;
        
        [self limpaTextField];
        
        
    }
    
    
    return NO;
    
}


- (void)longPressGestureRecognizer:(UILongPressGestureRecognizer *)recognizer{
    
    
    
    
    if (recognizer.state == UIGestureRecognizerStateBegan && [conteudoAtivo.name isEqualToString:@"caixa"]) {
        NSLog(@"funcionou");
    }else if (recognizer.state == UIGestureRecognizerStateBegan && [conteudoAtivo.name isEqualToString:@"label"]){
        [textField setHidden:NO];
    }
    
    
    
}

- (void)atualizaCaixa:(SpriteCaixaNode *)caixa Label:(SpriteLabelNode *)label{
    
    
    if ([label.tipo isEqualToString:@"CONTEUDO"]) {
        [caixa setLabelConteudo:label.text];
        
    }else if ([label.tipo isEqualToString:@"TIPO"]){
        [caixa setLabelTipo:label.text];
    }else{
        [caixa setLabelNome:label.text];
    }
    labelCriada = nil;
    [label removeFromParent];
}

- (void)limpaTextField{
    
    [textField resignFirstResponder];
    
    textField.text = nil;
    textField.hidden = YES;
}

- (void)reinicializaExercicio{
    passo++;
    passo = 4;
    [mensagemErro removeFromParent];
    mensagemErro = nil;
    if (passo > 3) {
        NSLog(@"acabou");
        SKLabelNode *acabou = [[SKLabelNode alloc]init];
        acabou.text = @"Parabéns";
        acabou.position = variavel.position;
        acabou.fontSize = 90;
        [variavel removeFromParent];
        [self addChild:acabou];
        [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"ExeVariavel2"];
        return;
    }
    
    [variavel removeFromParent];
    [trechoEmPortugol removeFromParent];
    [controlePasso removeFromParent];
    [self criaTrechoEmPortugol];
    [self criaVariavel];
    [self criandoPasso];
    
    
}

- (void)corrigirExercicio{
    
    //SEPARA AS STRINGS DO VETOR DE RESPOSTA
    
    NSString *tipo = [resposta objectAtIndex:0];
    NSString *nome = [resposta objectAtIndex:1];
    NSString *conteudo = [resposta objectAtIndex:3];
    
    //VERIFICA SE OS TEXOTS DAS LABELS DA CAIXA SAO IGUAIS AS RESPOSTAS
    
    if ([[variavel retornaTipo] isEqualToString:tipo] && [[variavel retornaNome] isEqualToString:nome] && [[variavel retornaConteudo] isEqualToString:conteudo]) {
        
        
        
        [self reinicializaExercicio];
        
        
        //NSLog(@"inicia novamente");
        
    }else{
        [self criaMensagemErro];
        //NSLog(@"errada");
    }
    
    
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
        [textField setHidden:NO];
        
        
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

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    
    if ([conteudoAtivo.name isEqualToString:@"label"]) {
        
        
        //Ao soltar o node de resposta em algum lugar varre o vetor de caixas para descobrir sobre quem está
        float xInicio = variavel.frame.origin.x;
        float xFim = xInicio + variavel.frame.size.width;
        //float xMeio = (xInicio + xFim)/2; PARA O FUTURO
        float yInicio = variavel.frame.origin.y;
        float yFim = yInicio + variavel.frame.size.height;
        //float yMeio = (yInicio + yFim)/2; PARA O FUTURO
        
        if ((conteudoAtivo.position.x > xInicio && conteudoAtivo.position.x < xFim)&&(conteudoAtivo.position.y >yInicio && conteudoAtivo.position.y < yFim)) { // Verifica se o nó "resposta" está sobre alguma caixa
            //NSLog(@"deu certo");
            [self atualizaCaixa:variavel Label:(SpriteLabelNode *) conteudoAtivo];
            
            
            //VERIFICA SE TODOS OS TEXTOS DAS LABELS DA CAIXA FORAM ALTERADAS
            
            if (![[variavel retornaTipo] isEqualToString:@"Insira o tipo"] && ![[variavel retornaNome] isEqualToString:@"Insira o nome"] && ![[variavel retornaConteudo] isEqualToString:@"Insira o conteúdo"]) {
                NSLog(@"todas respondidas");
                [self corrigirExercicio];
            }
            
            
        }
        
        //[conteudoAtivo setPosition:CGPointMake(xMeio, yMeio)]; //Coloca o node no centro da caixa
    }
    
}










@end
