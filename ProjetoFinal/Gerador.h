//
//  Gerador.h
//  ProjetoFinal
//
//  Created by Rafael Aparecido de Freitas on 07/08/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Gerador : NSObject

-(NSString*)retornaValorAleatorioParaOperador:(NSString*)operador;
-(NSString*)retornaValorInteiro:(int)inicio ate:(int)fim;
-(NSString*)retornaValorFloat:(int)inicio ate:(int)fim;
-(NSString*)retornaValorLogico;

-(NSString*)retornaOperadorDoTipo:(NSString*)tipoOperador;
-(NSString*)retornaOperadorRelacional;
-(NSString*)retornaOperadorAritmetico;
-(NSString*)retornaOperadorAtribuicao;
-(NSString*)retornaOperadorLogico;

-(NSString*)retornaNomeVariavel:(NSString*)tipo;
-(NSString*)retornaTipoVariavel;
-(NSString*)retornaValorVarivel:(NSString*)tipo;


@end
