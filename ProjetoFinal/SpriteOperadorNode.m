//
//  SpriteOperadorNode.m
//  testeSprite
//
//  Created by Felipe Costa Nascimento on 18/07/14.
//  Copyright (c) 2014 Felipe Costa Nascimento. All rights reserved.
//

#import "SpriteOperadorNode.h"

@implementation SpriteOperadorNode

-(id)init{
    self = [super init];
    
    if(self){
        [self inicializaClasse:@"" operador:@"" valor2:@"" resultado:@""];
    }
    
    return self;
}


-(id)initWithValor1:(NSString*)valor1 operador:(NSString*)operador valor2:(NSString*)valor2 resultado:(NSString*)resultado{
    if(self = [super init]){
        [self inicializaClasse:valor1 operador:operador valor2:valor2 resultado:resultado];
    }
    
    return self;
}

-(void)inicializaClasse:(NSString*)valor1 operador:(NSString*)operador valor2:(NSString*)valor2 resultado:(NSString*)resultado{
    //A PARTE QUE É EXIBIDO O RESULTADO É A PRIMEIRA A SER INSERIDA PRA QUE ELA FIQUE POR TRÁS DAS OUTRAS
    nodeResultado = [[OperadorResultadoNode alloc] initWithResultado:resultado];
    [self addChild:nodeResultado];
    
    //EM SEGUIDA É INSERIDO A PARTE QUE MOSTRA OS VALORES
    nodeValores = [[OperadorValoresNode alloc] initWithValor1:valor1 valor2:valor2];
    [nodeResultado addChild:nodeValores];
    
    //POR FIM É INSERIDO A PARTE QUE MOSTRA O OPERADOR
    nodeOperador = [[OperadorNode alloc] initWithOperador:operador];
    [nodeValores addChild:nodeOperador];
    
    [self setUserInteractionEnabled:YES];
    partesVisiveis = NO;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    if(clicouCirculo){
        //É CHAMADA A ANIMAÇÃO DO OPERADOR PRA ELE SE EXPANDIR AO TAMANHO NORMAL
        [nodeOperador iniciarAnimacaoExpandir];
        [self iniciarAnimacoes];
        clicouCirculo = NO;
    }
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint position = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:position];
    
    if([node.name isEqualToString:@"operador"]){
        [nodeOperador iniciarAnimacaoDiminuir];
        clicouCirculo = YES;
    }
}



-(void)iniciarAnimacoes{
    //O METODO VERIFICA QUAIS ANIMAÇÕES SERÃO EXECUTADAS CONFORME O ESTADO ATUAL DOS SPRITES
    //CASO OS SPRITES ESTIVEREM VISIVEIS SERÁ ACIONADO AS ANIMAÇÕES QUE "ESCONDERAM" OS SPRITES E ASSIM POR DIANTE
    if(partesVisiveis){
        [self iniciarAnimacaoFechar];
    
    }else{
        [self iniciarAnimacaoAbrir];
    }
    
}


-(void)iniciarAnimacaoAbrir{
    [self setUserInteractionEnabled:NO];
    
    //MANDA O NODE VALORES INICIAR A ANIMAÇÃO DAS LABELS DELE
    [nodeValores iniciarAnimacao];
    //EXECUTA A ANIMAÇÃO DO NODE VALORES QUE EXIBE O NODE
    [nodeValores runAction:[nodeValores getAnimacaoExpandir] completion:^{
        
        //MANDA O NODE RESULTADO INICIAR A ANIMAÇÃO DA LABEL DELE
        [nodeResultado iniciarAnimacao];
        //EXECUTA A ANIMAÇÃO DO NODE RESULTADO QUE EXIBE O NODE
        [nodeResultado runAction:[nodeResultado getAnimacaoDescer] completion:^{
            
            partesVisiveis = !partesVisiveis;
            [self setUserInteractionEnabled:YES];
            [nodeResultado removeAllActions];
            [nodeValores removeAllActions];
        }];
    }];

}


-(void)iniciarAnimacaoFechar{
    [self setUserInteractionEnabled:NO];
    
    //MANDA O NODE RESULTADO INICIAR A ANIMAÇÃO DA LABEL DELE
    [nodeResultado iniciarAnimacao];
    //EXECUTA A ANIMAÇÃO DO NODE RESULTADO QUE ESCONDE O NODE
    [nodeResultado runAction:[nodeResultado getAnimacaoSubir] completion:^{
        
        //MANDA O NODE VALORES INICIAR A ANIMAÇÃO DAS LABELS DELE
        [nodeValores iniciarAnimacao];
        //EXECUTA A ANIMAÇÃO DO NODE VALORES QUE ESCONDE O NODE
        [nodeValores runAction:[nodeValores getAnimacaoDiminuir] completion:^{
            
            partesVisiveis = !partesVisiveis;
            [self setUserInteractionEnabled:YES];
            [nodeResultado removeAllActions];
            [nodeValores removeAllActions];
        }];
    }];
}


-(void)setLabelValor1:(NSString*)valor1 operador:(NSString*)operador valor2:(NSString*)valor2 resultado:(NSString*)resultado{
    [self setLabelValor1:valor1];
    [self setLabelOperador:operador];
    [self setLabelValor2:valor2];
    [self setLabelResultado:resultado];
}

-(void)setLabelOperador:(NSString*)operador{
    [nodeOperador setLabelOperador:operador];
}

-(void)setLabelValor1:(NSString*)valor1{
    [nodeValores setLabelValor1:valor1];
}

-(void)setLabelValor2:(NSString*)valor2{
    [nodeValores setLabelValor2:valor2];
}

-(void)setLabelResultado:(NSString*)resultado{
    [nodeResultado setLabelResultado:resultado];
}


-(NSString*)getValor1{
    return [nodeValores getValor1];
}

-(NSString*)getOperador{
    return [nodeOperador getOperador];
}

-(NSString*)getValor2{
    return [nodeValores getValor2];
}

-(BOOL)partesVisiveis{
    return partesVisiveis;
}


-(void)ativarModoCondicao{
    nodeResultado = nil;
    [nodeOperador setSize:CGSizeMake(89, 89)];
    [nodeValores setSize:CGSizeMake(257, 64)];
    [nodeValores ativarModoCondicao];
}

@end
