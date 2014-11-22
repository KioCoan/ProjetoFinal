//
//  ViewController.m
//  MagicPie
//
//  Created by Alexandr on 30.09.13.
//  Copyright (c) 2013 Alexandr Corporation. All rights reserved.
//

#import "EstatisticaViewController.h"
#import "MagicPieLayer.h"
#import "EstatisticaPieView.h"


@interface EstatisticaViewController()
@property EstatisticaPieView* pieView;
@property EstatisticaPieView* pieView2;
@end

@implementation EstatisticaViewController
@synthesize pieView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    
    float red = 145;
    float green = 186;
    float blue = 193;
    
    
    CGRect frame = CGRectMake(0, 0, 768, 550);
    self.pieView = [[EstatisticaPieView alloc] initWithFrame:frame];
    [self.pieView setBackgroundColor:[UIColor clearColor]];
    self.pieView.corPadrao = [UIColor colorWithRed:red / 255 green:green / 255 blue:blue / 255 alpha:1];
    [[self view] addSubview:self.pieView];
    
    red = 157;
    green = 78;
    blue = 84;
    
    self.pieView2 = [[EstatisticaPieView alloc] initWithFrame:frame];
    [self.pieView2 setBackgroundColor:[UIColor clearColor]];
    self.pieView2.corPadrao = [UIColor colorWithRed:red / 255 green:green / 255 blue:blue / 255 alpha:1];
    [[self view] addSubview:self.pieView2];
    
    [self iniciarGrafico];
}



- (void)iniciarGrafico{
    int totalExercicios = 14;
    int nAcertos = 10;
    int nErros = totalExercicios - nAcertos;
    
    //CALCULA A PORCENTAGEM DE ACERTOS
    float porcentagemAcertos = (nAcertos * 100) / totalExercicios;
    
    //CALCULA QUANTOS GRAUS REPRESENTA A PORCENTAGEM DE ACERTOS E ERROS
    float grausAcerto = (porcentagemAcertos * 360) / 100;
    float grausErro = 360 - grausAcerto;
    
    //CALCULA O GRAU EM QUE TERMINA OS GRAUS DE ACERTO
    float grauAcertoEnd = 450 - grausAcerto;
    float grauErroEnd = grauAcertoEnd - grausErro;
    
    
    
    PieElement* newElem = [PieElement pieElementWithValue:nAcertos color:self.pieView.corPadrao];
    newElem.tipoDado = @"Acertos";
    newElem.showTitle = YES;
    int insertIndex = arc4random() % (self.pieView.layer.values.count + 1);
    [self.pieView.layer insertValues:@[newElem] atIndexes:@[@(insertIndex)] animated:YES];
    
    self.pieView.layer.animationDuration = 0.6;
    self.pieView.layer.startAngle = 450;
    self.pieView.layer.endAngle = grauAcertoEnd;
    self.pieView.layer.showTitles = ShowTitlesAlways;
    
    
    
    
    PieElement* newElem2 = [PieElement pieElementWithValue:nErros color:self.pieView2.corPadrao];
    newElem2.tipoDado = @"Erros";
    newElem2.showTitle = YES;
    int insertIndex2 = arc4random() % (self.pieView2.layer.values.count + 1);
    [self.pieView2.layer insertValues:@[newElem2] atIndexes:@[@(insertIndex2)] animated:YES];
    
    self.pieView2.layer.animationDuration = 2.5;
    self.pieView2.layer.startAngle = grauAcertoEnd;
    self.pieView2.layer.endAngle = grauErroEnd;
    self.pieView2.layer.showTitles = ShowTitlesAlways;
    
    
}


@end


