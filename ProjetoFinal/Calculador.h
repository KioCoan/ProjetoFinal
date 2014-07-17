//
//  Calculador.h
//  Calculador
//
//  Created by Rafael Aparecido de Freitas on 03/07/14.
//  Copyright (c) 2014 Rafael Aparecido de Freitas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Relacional.h"
#import "Aritimetico.h"
#import "Logico.h"
@interface Calculador : NSObject


@property Relacional *relacional;
@property Aritimetico *aritimetico;
@property Logico *logico;

//-(BOOL)oDado:(NSString*)dado eDoTipo:(NSString*)tipo;

@end
