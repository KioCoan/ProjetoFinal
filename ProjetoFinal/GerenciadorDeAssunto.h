//
//  GerenciadorDeAssunto.h
//  ProjetoFinal
//
//  Created by Kio Coan on 30/06/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Assunto.h"

@interface GerenciadorDeAssunto : NSObject

@property Assunto* assunto;

+(id)gerenciador;
+(void)mudarAssunto:(Assunto*)assunto;


@end
