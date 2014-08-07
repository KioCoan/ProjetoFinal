//
//  Gerador.h
//  ProjetoFinal
//
//  Created by Rafael Aparecido de Freitas on 07/08/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Gerador : NSObject

-(int)retornaInteiro:(int)inicio ate:(int)fim;
-(float)retornaFloat:(int)inicio ate:(int)fim;
-(NSString*)retornaOperadorRelacional;

@end
