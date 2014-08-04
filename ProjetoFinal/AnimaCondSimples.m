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
    [[self physicsWorld] setContactDelegate:self];
    [[self physicsWorld] setGravity:CGVectorMake(0, -5)];
    nPulos = 0;
    
    //INICIALIZA O SPRITE DA CONDIÇÃO E CRIA OS VALORES DAS CONDIÇÕES
    [self inicializaCondicaoNode];
    [condicaoNode criarCondicaoSe:@"200" operador:@">" valor2:@"100"];
    [condicaoNode criarCondicaoSenaoSe:@"100" operador:@"<" valor2:@"200"];
    condicaoCorreta = [condicaoNode getCondicaoCorreta];
    [self inicializarlabels];
}


-(void)inicializaCondicaoNode{
    condicaoNode = [[SpriteCondicaoNode alloc] init];
    [condicaoNode setPosition:CGPointMake(150, 250)];

    [condicaoNode iniciarAnimacao];
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
        [self testes];
    }
}

-(void)didBeginContact:(SKPhysicsContact *)contact{
    if([condicaoCorreta isEqualToString:@"se"]){
        [self controlaImpulsoSe:contact];
    
    }else if([condicaoCorreta isEqualToString:@"senaoSe"]){
        [self controlaImpulsoSenaoSe:contact];
    
    }else{
        
    }
    

}

-(void)controlaImpulsoSe:(SKPhysicsContact*)contact{
    if(nPulos < 2){
        [self impulsoBaseDireita:contact];
    
    }else{
        [self impulsoBaseFim:contact];
        [condicaoNode removerCorpoSe];
    }
    
}

-(void)controlaImpulsoSenaoSe:(SKPhysicsContact*)contact{
    if(nPulos < 2){
        [self impulsoBaseDireita:contact];
        
        
    }else if(nPulos == 2){
        [self impulsoBaseProximo:contact];
        [condicaoNode removerCorpoSe];
        
    }else if(nPulos < 5){
        [[contact bodyB] applyImpulse:CGVectorMake(7, 13)];
        nPulos++;
        //[self impulsoBaseDireita:contact];
    
    }else{
        [self impulsoBaseFim:contact];
        [condicaoNode removerCorpoSenaoSe];
    }
    
}


-(void)impulsoBaseDireita:(SKPhysicsContact*)contact{
    [[contact bodyB] applyImpulse:CGVectorMake(5, 13)];
    nPulos++;
}

-(void)impulsoBaseFim:(SKPhysicsContact*)contact{
    [[contact bodyB] applyImpulse:CGVectorMake(-23, 15)];
    [condicaoNode encerrarTeste];
    nPulos = 0;
}

-(void)impulsoBaseProximo:(SKPhysicsContact*)contact{
    [[contact bodyB] applyImpulse:CGVectorMake(-14, 15)];
    nPulos++;
}

-(void)testes{
    
    [condicaoNode iniciarTeste];
    
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
