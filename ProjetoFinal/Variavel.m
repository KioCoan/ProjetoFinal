//
//  Variavel.m
//  ProjetoFinal
//
//  Created by Rafael Aparecido de Freitas on 02/07/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "Variavel.h"

@implementation Variavel


-(id)init{
    
    
    self = [super init];
    
    if (self) {
        [self setAnimacao:[[AnimaVariavel alloc] init]];
        [self montaTeoria];
    }
    return self;
}


-(void)montaTeoria{
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"ConceitosVariaveis"
                                                     ofType:@"txt"];
    
    NSString* content = [NSString stringWithContentsOfFile:path
                                                  encoding:NSUTF8StringEncoding
                                                     error:NULL];

    
    [self setTeoriaFormatada:[NSMutableArray arrayWithArray:[content componentsSeparatedByString:@"#"]]];
    
  
    
    
    
}

@end
