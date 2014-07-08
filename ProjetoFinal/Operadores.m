//
//  Operadores.m
//  ProjetoFinal
//
//  Created by Felipe Costa Nascimento on 08/07/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "Operadores.h"

@implementation Operadores

-(id)init{
    
    
    self = [super init];
    
    if (self) {
        [self setAnimacao:[[AnimaOperadores alloc] init]];
        [self montaTeoria];
        [self setNome:@"Operadores"];
    }
    return self;
}


-(void)montaTeoria{
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"ConceitosOperadores"
                                                     ofType:@"txt"];
    
    NSString* content = [NSString stringWithContentsOfFile:path
                                                  encoding:NSUTF8StringEncoding
                                                     error:NULL];
    
    
    [self setTeoriaFormatada:[NSMutableArray arrayWithArray:[content componentsSeparatedByString:@"#"]]];
    
    
    
    
    
}


@end
