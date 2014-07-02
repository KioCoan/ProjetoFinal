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

    NSArray *myWords = [self.teoria componentsSeparatedByString:@"#"];
    
    [self setTeoriaFormatada:[[NSMutableArray alloc] initWithArray:myWords]];

    
    NSLog(@"%@",[self.teoriaFormatada objectAtIndex:0]);
    
}


@end
