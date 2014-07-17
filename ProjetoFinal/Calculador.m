//
//  Calculador.m
//  Calculador
//
//  Created by Rafael Aparecido de Freitas on 03/07/14.
//  Copyright (c) 2014 Rafael Aparecido de Freitas. All rights reserved.
//

#import "Calculador.h"

@implementation Calculador

-(id)init{
    
    self = [super init];
    
    if (self) {
    
        self.relacional = [[Relacional alloc] init];
        self.aritimetico = [[Aritimetico alloc]init];
        self.logico = [[Logico alloc] init];
        self.geral = [[Geral alloc] init];
        
    }
    return self;
    
}

//-(BOOL)oDado:(NSString*)dado eDoTipo:(NSString*)tipo{
//    
//    if ([tipo isEqualToString:@"inteiro"]) {
//        @try {
//            int i = [dado intValue];
//            
//        }
//        @catch (NSException *exception) {
//            return NO;
//        }
//        
//    }else if ([tipo isEqualToString:@"inteiro"]){
//        
//    }else if ([tipo isEqualToString:@"inteiro"]){
//        
//    }
//    
//    
//    
//    return YES;
//}



@end
