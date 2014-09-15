//
//  CenaLivre.m
//  ProjetoFinal
//
//  Created by Henrique Pereira de Lima on 12/09/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "CenaLivre.h"
#import "SpriteCaixaNode.h"

@implementation CenaLivre{
    
    UIScrollView *scrollView;
    
}


-(id)init{
    
    self = [super init];
    
    if (self) {
        
        self.backgroundColor = [SKColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:1.0];
        
        scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(200, 400, 500, 150)];
        scrollView.backgroundColor = [UIColor whiteColor];
        
        [self.view addSubview:scrollView];
        
        SpriteCaixaNode *teste = [[SpriteCaixaNode alloc]initWithConteudo:@"teste" nome:@"seila" tipo:@"opa" tamanho:CGSizeMake(200 , 200)];
        
        UIImage *imagem = [UIImage imageNamed:@"abrir-caixa1.png"];
        
        UIImageView *image = [[UIImageView alloc]initWithImage:imagem];
        
        [scrollView addSubview:image];
        teste.position = CGPointMake(200, 70);
        
        [self addChild:teste];
        
    }
    return self;
}


@end
