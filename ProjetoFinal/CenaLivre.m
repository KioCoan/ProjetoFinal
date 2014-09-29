//
//  CenaLivre.m
//  ProjetoFinal
//
//  Created by Henrique Pereira de Lima on 12/09/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "CenaLivre.h"
#import "SpriteOperadorNode.h"
#import "MenuNode.h"
#import "Calculador.h"
#import "OperadorNode.h"
static const uint32_t categoriaBotaoMenu = 0x1 << 0;
static const uint32_t categoriaCaixa = 0x1 << 1;

@implementation CenaLivre{
    
    MenuNode *menu;
    SKNode *conteudoAtivo;
    SKSpriteNode *botaoMenu;
    SKSpriteNode *menuEdicao;
    NSMutableArray *vetorTextField;
    NSMutableArray *vetorOperadores;
    NSMutableArray *vetorVariaveis;
    BOOL menuEditarAberto;
    int contadorVariavel;
    BOOL estaEmContato;
    SKNode *objetoEditando;
    SpriteOperadorNode *operadorEditando;
    
}


// METODOS DE INICIACAO

-(id)init{
    
    self = [super init];
    
    if (self) {
        
        //CONFIGURANDO CENA
        self.backgroundColor = [SKColor whiteColor];
        self.name = @"fundo";
        self.physicsWorld.contactDelegate = self;
        self.physicsWorld.gravity = CGVectorMake(0, 0);
        
        //CRIANDO BOTAO QUE ABRE MENU
        botaoMenu = [[SKSpriteNode alloc]initWithImageNamed:@"modo livre-09.png"];
        botaoMenu.position = CGPointMake(100, 100);
        botaoMenu.name = @"botaoMenu";
        botaoMenu.zPosition = -2;
        [self addChild:botaoMenu];
        
        botaoMenu.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:botaoMenu.frame.size];
        botaoMenu.physicsBody.dynamic = NO;
        botaoMenu.physicsBody.categoryBitMask = categoriaBotaoMenu;
        botaoMenu.physicsBody.contactTestBitMask = categoriaCaixa;
        botaoMenu.physicsBody.density = 1000;
        botaoMenu.physicsBody.usesPreciseCollisionDetection = YES;

        
        
        //CRIANDO MENU
        menu = [[MenuNode alloc]initWithPosicaoAbrir:CGPointMake(245, 480) tamanho:CGSizeMake(490, 960)];
        
        [self addChild:menu];
        
        
        [self criaMenuEdicao];
        
        /*
        
         TRIM e TIRAR ESPACOS DA STRING
         
        NSString *testando = @"    eu sei que e hj";
        NSString *nova2 = [testando stringByReplacingOccurrencesOfString:@" " withString:@""];
        NSString *nova = [testando stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        
        
        
        NSLog(@"nova string %@",testando);
        
        */
        
        
        
    }
    return self;
}

- (void)didMoveToView:(SKView *)view{
    
    [self criandoTodosTextFields];
    
}

//METODOS MENU

- (void)criaMenuEdicao{
    
    menuEdicao = [[SKSpriteNode alloc] initWithImageNamed:@"MenuEditarFundo.png"];
    [menuEdicao setSize:CGSizeMake(770, 70)];
    [menuEdicao setPosition:CGPointMake(385, 925)];
    
    
    //CRIANDO BOTAO OK
    SKSpriteNode *botaoOK = [[SKSpriteNode alloc]initWithImageNamed:@"MenuEditarBotao.png"];
    botaoOK.name = @"botaoOK";
    [botaoOK setPosition:CGPointMake(300, -3)];
    [botaoOK setSize:CGSizeMake(110, 50)];
    [menuEdicao addChild:botaoOK];
    
    
    //CRIANDO LABEL DO BOTAO OK
    SKLabelNode *lblOk = [[SKLabelNode alloc]initWithFontNamed:@"Helvetica"];
    lblOk.name = @"botaoOK";
    lblOk.fontColor = [SKColor whiteColor];
    lblOk.text = @"OK";
    lblOk.zPosition = 1;
    [lblOk setPosition:CGPointMake(botaoOK.position.x, botaoOK.position.y - 10)];
    [menuEdicao addChild:lblOk];
}

-(void)moveMenuEdicao{
    
    if (menuEditarAberto) {
        menuEditarAberto = NO;
        [menuEdicao removeFromParent];
        
    }else{
        menuEditarAberto = YES;
        [self addChild:menuEdicao];
        
    }
    
    [self mostraEscondeTextField:!menuEditarAberto];
    
}

- (void)botaoMenuCresci:(BOOL)cresci{
    
    //ANIMACAO BOTAO MENU
    
    if (cresci) {
        SKAction *rodaBotao = [SKAction rotateByAngle:M_PI duration:0.5];
        SKAction *trocaTexture1 = [SKAction setTexture:[SKTexture textureWithImageNamed:@"modo livre-10.png"]];
        SKAction *trocaTexture2 = [SKAction setTexture:[SKTexture textureWithImageNamed:@"modo livre-11.png"]];
        SKAction *trocaTexture3 = [SKAction setTexture:[SKTexture textureWithImageNamed:@"modo livre-12.png"]];
        
        [botaoMenu runAction:rodaBotao completion:^{
            
            [botaoMenu runAction:trocaTexture1 completion:^{
                
                [botaoMenu runAction:trocaTexture2 completion:^{
                    
                    [botaoMenu runAction:[SKAction resizeToWidth:150 height:150 duration:0.5] completion:^{
                        
                        [botaoMenu runAction:trocaTexture3];
                        
                    }];
                    
                }];
                
                
            }];
            
            
            
            
        }];
        
    }else{
        
        //DIMINUI
        
        //ANIMACAO BOTAO MENU
        
        SKAction *rodaBotao = [SKAction rotateByAngle:-M_PI -0.8 duration:0.5];
        SKAction *trocaTexture1 = [SKAction setTexture:[SKTexture textureWithImageNamed:@"modo livre-11.png"]];
        SKAction *trocaTexture2 = [SKAction setTexture:[SKTexture textureWithImageNamed:@"modo livre-10.png"]];
        SKAction *trocaTexture3 = [SKAction setTexture:[SKTexture textureWithImageNamed:@"modo livre-09.png"]];
        
        
        
        [botaoMenu runAction:trocaTexture1 completion:^{
            
            [botaoMenu runAction:trocaTexture2 completion:^{
                
                NSLog(@"size %f",botaoMenu.texture.size.height);
                [botaoMenu runAction:[SKAction resizeToWidth:51 height:51 duration:0.5] completion:^{
                    
                    [botaoMenu runAction:rodaBotao completion:^{
                        
                        [botaoMenu runAction:trocaTexture3];
                    }];
                }];
                
            }];
            
            
        }];
        
    }
    
    
}


- (SKAction *)retornaCrescerDiminuir:(BOOL)aumenta{
    
    //ANIMACAO QUE OCORRE QUANDO USUARIO CLICA NO ICONE
    
    if (aumenta) {
        return [SKAction scaleTo:1.1 duration:0.1];
    }
    
    return [SKAction scaleTo:1 duration:0.1];
    
    
}

// METODO TEXTFIELD

- (void)criandoTodosTextFields{
    
    //ALLOCANDO VETOR TEXTFILED
    vetorTextField = [NSMutableArray array];
    
    CGRect bounds = CGRectMake(self.size.width * 0.05, self.size.height * 0.08, 250, 40);

    for (int i = 0; i < 2; i++) {
        UITextField *textField = [self criaTextFieldBounds:bounds];
        
        [self.view addSubview:textField];
        [vetorTextField addObject:textField];
        
        bounds.origin.x += bounds.size.width * 1.2;
        //bounds.origin.y += bounds.size.height * 1.5;
    }
    
}

- (UITextField *)criaTextFieldBounds:(CGRect)bounds{
    
    //CRIA E RETORNA APENAS UM TEXTFIELD
    UITextField *textField = [[UITextField alloc] initWithFrame:bounds];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.textColor = [UIColor blackColor];
    textField.font = [UIFont systemFontOfSize:25.0];
    textField.placeholder = @"Insira o valor";
    textField.backgroundColor = [UIColor whiteColor];
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    //textField.keyboardType = UIKeyboardTypeDefault;
    textField.keyboardAppearance = UIKeyboardAppearanceDark;
    textField.returnKeyType = UIReturnKeyDone;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    textField.clearsContextBeforeDrawing = YES;
    textField.delegate = self;
    textField.hidden = YES;
    
    
    return textField;
    
}

-(void)mostraEscondeTextField:(BOOL)mostra{
    
    for (UITextField *textField in vetorTextField) {
        if (!mostra) {
            [self limpaTextField:textField];
        }
        
        textField.hidden = mostra;
    }
}

- (void)preparaTextFieldsVariavel{
    
    SpriteCaixaNode *variavel = (SpriteCaixaNode *)objetoEditando;
    
    for (int i = 0; i < vetorTextField.count;i++) {
        
        UITextField *textField = [vetorTextField objectAtIndex:i];
        
        switch (i) {
            case 0:
                textField.placeholder = @"insira nome";
                break;
                
            case 1:
                textField.placeholder = @"insira conteúdo";
                textField.keyboardType = [self variavelNumerica:variavel];
                break;
        }
    }
}

- (void)preparaTextFieldsOperador{
    
    
    
    for (int i = 0; i < vetorTextField.count;i++) {
        
        UITextField *textField = [vetorTextField objectAtIndex:i];
        textField.keyboardType = UIKeyboardTypeNumberPad;
        
        
        switch (i) {
            case 0:
                textField.placeholder = @"insira valor1";
                break;
                
            case 1:
                textField.placeholder = @"insira valor2";
                break;
        }
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    
    return YES;
}

- (void)limpaTextField:(UITextField *)textField{
    
    //LIMPA A TEXTFIELD
    
    [textField resignFirstResponder];
    
    textField.text = nil;
}



// METODOS VARIAVEIS


-(void)criarVariavelTipo:(NSString *)tipo posicao:(CGPoint)posicao{
    
    if (vetorVariaveis == nil) {
        vetorVariaveis = [NSMutableArray array];
    }
    
    
    SpriteCaixaNode *variavel = [[SpriteCaixaNode alloc]init];
    
    
    [variavel setDono:self];
    [variavel setPosition:posicao];
    variavel.name = @"variavel";
    variavel.zPosition = -1;
    [variavel setLabelTipo:tipo];
    [variavel setLabelEndereco:++contadorVariavel];
    [variavel setBotaoMenu:botaoMenu.frame];
    [variavel setMyDelegate:self];
    [self addChild:variavel];
    
    
    //CRIA CORPO DA CAIXA
    variavel.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:variavel.frame.size];
    variavel.physicsBody.dynamic = YES;
    variavel.physicsBody.categoryBitMask = categoriaCaixa;
    variavel.physicsBody.collisionBitMask = 0;
    variavel.physicsBody.density = 0;
    variavel.physicsBody.usesPreciseCollisionDetection = YES;
    
    [vetorVariaveis addObject:variavel];
}

- (UIKeyboardType)variavelNumerica :(SpriteCaixaNode *)variavel{
    
    NSArray *tiposVariaveis = [NSArray arrayWithObjects:@"inteiro",@"real",@"caractere",@"logico", nil];
    
    
    int i = 0;
    
    for (i = 0; i < tiposVariaveis.count; i++) {
        
        if ([[variavel retornaTipo] isEqualToString:[tiposVariaveis objectAtIndex:i]]) {
            
            break;
            
        }
        
    }
    
    switch (i) {
        case 0:
        case 1:
            return  UIKeyboardTypeNumberPad;
            break;
            
        default:
            return UIKeyboardTypeDefault;
            break;
    }
    
}

-(void)terminouGestureCaixa:(SKNode *)caixa{
    
    if (estaEmContato) {
        [caixa removeFromParent];
        [self didEndContact:nil];
    }
}


// METODOS OPERADORES

-(void)criarOperadorNaPosicao:(CGPoint)posicao tipo:(NSString *)tipo{
    
    if (vetorOperadores == nil) {
        vetorOperadores = [NSMutableArray array];
    }
    
    SpriteOperadorNode *novoOperador = [[SpriteOperadorNode alloc]initWithValor1:nil operador:tipo valor2:nil resultado:nil];
    
    [novoOperador setDono:self];
    [novoOperador setPosition:posicao];
    //caixa.size = CGSizeMake(200, 200);
    novoOperador.zPosition = -1;
    novoOperador.name = @"operador";
    novoOperador.myDelegateGesture = self;
    
    [novoOperador criarCorpos];
    
    [self addChild:novoOperador];
    [vetorOperadores addObject:novoOperador];
}

-(void)criaObjetoPosicao:(CGPoint)posicao{
    
    IconeSecao *icone = (IconeSecao *)conteudoAtivo;
    
    [icone runAction:[SKAction moveTo:icone.posicaoAnterior duration:0]];
    
    
    if ([icone.secao isEqualToString:@"variavel"]) {
        
        [self criarVariavelTipo:icone.tipo posicao:posicao];
    }else if ([icone.secao isEqualToString:@"operador"]){
        
        
        [self criarOperadorNaPosicao:posicao tipo:icone.tipo];
    }
    
}

- (void)terminouGestureOperador:(SKNode *)operador{
    
    
    if (estaEmContato) {
        [operador removeFromParent];
        [self didEndContact:nil];
    }
    
    
}

- (SpriteOperadorNode *)retornaOperadorNode{
    
    for (SpriteOperadorNode *node in vetorOperadores) {
        
        
        
        if ([objetoEditando isEqual:[node retornaOperadorNode]]) {
            return node;
        }
    }
    
    return nil;
}



// METODOS OBJETOS

- (void)insereValores{
    
    //INSERE VALOR VARIAVEIS
    if ([objetoEditando.name isEqualToString:@"variavel"]) {
        SpriteCaixaNode *variavel = (SpriteCaixaNode *)objetoEditando;
        
        for (int i = 0; i < vetorTextField.count;i++) {
            
            UITextField *textField = [vetorTextField objectAtIndex:i];
            
            
            switch (i) {
                case 0:
                    [variavel setLabelNome:textField.text];
                    break;
                    
                case 1:
                    [variavel setLabelConteudo:textField.text];
                    break;
            }
        }
        
        // INSERE VALOR NO OPERADOR
        
    }else if ([objetoEditando.name isEqualToString:@"operador"]){
        
        SpriteOperadorNode *operador = [self retornaOperadorNode];
        
        for (int i = 0; i < vetorTextField.count;i++) {
            
            UITextField *textField = [vetorTextField objectAtIndex:i];
            switch (i) {
                case 0:
                    [operador setLabelValor1:textField.text];
                    
                    break;
                    
                case 1:
                    [operador setLabelValor2:textField.text];
                    break;
            }
        }
        
        Calculador *calculador = [[Calculador alloc]init];
        
        
        [operador setLabelResultado:[calculador calculaOperador:[operador getOperador] numero1:[operador getValor1] numero2:[operador getValor2]]];
        
    }
    
    [self moveMenuEdicao];
    objetoEditando = nil;
}

- (void)identificaNodeETap:(int)tap{
    
    
    if ([conteudoAtivo.name isEqualToString:@"botaoMenu"]) {
        [menu abrirFechar];
        [self.myDelegate esconderNavigationController: [menu getAberto]];
        
        
    }else if ([menu getAberto] && [conteudoAtivo.name isEqualToString:@"fundo"]){
        [menu abrirFechar];
        [self.myDelegate esconderNavigationController: [menu getAberto]];
    }else if ([conteudoAtivo.name isEqualToString:@"iconeMenu"]){
        [conteudoAtivo runAction:[self retornaCrescerDiminuir:YES]];
    }else if (tap == 2){
        
        if ([conteudoAtivo.name isEqualToString:@"variavel"]) {
            objetoEditando = conteudoAtivo;
            
            [self preparaTextFieldsVariavel];
            [self moveMenuEdicao];
        }else if ([conteudoAtivo.name isEqualToString:@"operador"]){
            objetoEditando = conteudoAtivo;
            [self preparaTextFieldsOperador];
            [self moveMenuEdicao];

            
            
        }
        
    }
    
    
    
    
    
   /* else if ([conteudoAtivo.name isEqualToString:@"variavel"] || [conteudoAtivo.name isEqualToString:@"operador"]){
        objetoAnimando = conteudoAtivo;
        
        [self preparaTextFieldsVariavel];
        [self moveMenuEdicao];
    }*/  else if ([conteudoAtivo.name isEqualToString:@"botaoOK"]){
        [self insereValores];
    }

    
    
}





// METODOS CONTATOS

- (void)didBeginContact:(SKPhysicsContact *)contact{
    
    NSLog(@"entrou contato");
    estaEmContato = YES;
    
    [self botaoMenuCresci:YES];
    
    
}

- (void)didEndContact:(SKPhysicsContact *)contact{
    estaEmContato = NO;
    [self botaoMenuCresci:NO];
}



// METODOS TOUCHES

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    
    UITouch *touch = [touches anyObject];
    CGPoint location =  [touch locationInNode:self];
    
    
    conteudoAtivo = [self nodeAtPoint:location];
    
    
    
    [self identificaNodeETap:[touch tapCount]];
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    
    
    //SE A POSIÇÃO QUE FOI CLICADA É A MESMA DO SPRITE DA CAIXA, O SPRITE É MOVIDO
    
    if ([conteudoAtivo.name isEqualToString:@"iconeMenu"]) {
        
        CGPoint location = [touch locationInNode:menu];
        [conteudoAtivo setPosition:location];
        
    }
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    if ([conteudoAtivo.name isEqualToString:@"iconeMenu"]) {
        
        UITouch *touch = [touches anyObject];
        CGPoint location = [touch locationInNode:self];
        
        float xInicio = menu.frame.origin.x;
        float xFim = xInicio + menu.frame.size.width;
        float yInicio = menu.frame.origin.y;
        float yFim = yInicio + menu.frame.size.height;
        

        if ((location.x >= xInicio && location.x <= xFim) && (location.y >= yInicio && location.y <= yFim)) {
            
            
            IconeSecao *icone = (IconeSecao *)conteudoAtivo;
            [icone runAction:[SKAction moveTo:icone.posicaoAnterior duration:0.3]];
            [icone runAction:[self retornaCrescerDiminuir:NO]];
            
            
        }else{
            
            [self criaObjetoPosicao:location];
            
            [menu abrirFechar];
            [self.myDelegate esconderNavigationController: [menu getAberto]];
            
            
        }
        
        
        
    }
    conteudoAtivo = nil;
    
}

@end
