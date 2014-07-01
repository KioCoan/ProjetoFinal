//
//  Variavel.m
//  ProjetoFinal
//
//  Created by Rafael Aparecido de Freitas on 01/07/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "Variavel.h"

@implementation Variavel

-(id)init{
    
    self = [super init];
    if (self) {
        [self formataString];
    }
    return self;
}


-(void)formataString{
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"ConceitosVariaveis" ofType:@"txt"];
    
    self.teoria = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];

    NSLog(@"%@",self.teoria);
    
    
    
    NSArray *myWords = [self.teoria componentsSeparatedByString:@"#"];
    NSArray *stt = [self.teoria ]
    
    NSLog(@"%@",myWords);
    
    
    [self setTeoriaFormatada:[[NSMutableArray alloc] initWithArray:myWords]];

    
    NSLog(@"%@",self.teoriaFormatada);
    
}


@end
