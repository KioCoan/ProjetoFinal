//
//  GerenciadorDeAssunto.m
//  ProjetoFinal
//
//  Created by Kio Coan on 30/06/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "GerenciadorDeAssunto.h"

//static GerenciadorDeAssunto* gerenciador;

@implementation GerenciadorDeAssunto


+ (GerenciadorDeAssunto *)sharedGerenciador{
    static GerenciadorDeAssunto *gerencidaorAssunto = nil;
    
    if (!gerencidaorAssunto) {
        gerencidaorAssunto = [[super allocWithZone:nil]init];
        
    }
    return gerencidaorAssunto;
}

+ (id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedGerenciador];
}



//+(id)gerenciador{
//    @synchronized(self){
//        if (gerenciador == nil) {
//            gerenciador = [[self alloc]init];
//        }
//    }
//    return gerenciador;
//}
//
//+(void)mudarAssunto:(Assunto *)assunto{
//    @synchronized(self){
//        gerenciador.assunto = assunto;
//    }
//}

@end
