//
//  SecaoMenu.m
//  ProjetoFinal
//
//  Created by Henrique Pereira de Lima on 16/09/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "SecaoMenu.h"

@implementation SecaoMenu{
    
}

- (void)criarTodosIcones{
    
}

- (IconeSecao *)retornaIconeIndice:(int)indice{
    
    return [icones objectAtIndex:indice];
    
}

- (UIImageView *)retornaIconeIndice2:(int)indice{
    
    return [icones objectAtIndex:indice];
    
}



- (int)retornaNumeroIcones{
    return  (int)icones.count;
}


- (void)removeTodosIcones{
    
    for (IconeSecao *icone in icones) {
        [icone removeFromParent];
    }
    
}

- (void)removeTodosIcones2{
    
    for (UIImageView *iconeView in icones) {
        [iconeView removeFromSuperview];
    }
    
}

- (IconeSecao *)criarIconeSecao :(NSString *)titulo tipo:(NSString *)tipo posicao:(CGPoint)posicao{
    
    IconeSecao *icone = [[IconeSecao alloc]init];
    
    [icone setSecao:titulo];
    [icone setTipo:tipo];
    [icone setPosition:posicao];
    [icone setName:@"iconeMenu"];
    
    return icone;
}

- (IconeSecao *)criarIconeSecao :(NSString *)titulo tipo:(NSString *)tipo imagem:(NSString *)imagem{
    
    
    IconeSecao *icone = [[IconeSecao alloc]init];
    
    [icone setSecao:titulo];
    [icone setTipo:tipo];
    [icone setName:@"iconeMenu"];
    [icone setTexture:[SKTexture textureWithImageNamed:imagem]];
    
    return icone;
    
}

- (IconeView *)criaIconeSecaoImagem:(NSString *)imagem{
    
    IconeView *iconeView = [[IconeView alloc]initWithImage:[UIImage imageNamed:imagem]];
    
    return iconeView;
    
}

- (id)init{
    
    self = [super init];
    
    
    if  (self){
        
        [self setUserInteractionEnabled:YES];
        
        
    }
    return self;
    
    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [self.myDelegate fuiClicado:self.titulo];

}

@end
