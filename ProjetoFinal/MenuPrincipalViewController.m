//
//  MenuPrincipalViewController.m
//  ProjetoFinal
//
//  Created by Rafael Aparecido de Freitas on 11/09/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "MenuPrincipalViewController.h"
#import "MagicPieLayer.h"
#import "EstatisticaPieView.h"
#import "Expressao.h"

@interface MenuPrincipalViewController ()
@property EstatisticaPieView* pieView;
@property EstatisticaPieView* pieView2;
@end

@implementation MenuPrincipalViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //CGPoint posicaoAtual = self.imgTransition.frame.origin;
    [[self view] setUserInteractionEnabled:NO];
    
    [self performSelector:@selector(iniciarAnimacaoDeEntrada) withObject:nil afterDelay:0.5];
    
    CGRect frame = CGRectMake(0, 0, 768, 500);
    self.pieView = [[EstatisticaPieView alloc] initWithFrame:frame];
    [self.pieView setBackgroundColor:[UIColor clearColor]];
    [[self view] addSubview:self.pieView];
    
    self.pieView2 = [[EstatisticaPieView alloc] initWithFrame:frame];
    [self.pieView2 setBackgroundColor:[UIColor clearColor]];
    [[self view] addSubview:self.pieView2];
    
}

-(void)iniciarAnimacaoDeEntrada{
    
    CABasicAnimation *moveUp;
    moveUp = [CABasicAnimation animationWithKeyPath:@"position.y"];
    moveUp.byValue  = @(-self.imgTransition.frame.size.height / 2); // or [NSNumber numberWithFloat:-50.0f] if you really need to
    moveUp.duration = 1.5;
    moveUp.removedOnCompletion = NO;
    moveUp.fillMode = kCAFillModeBoth;
    moveUp.delegate = self;
    [moveUp setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    
    [CATransaction begin];{
        [CATransaction setCompletionBlock:^{
            
            //[self.imgTransition.layer addAnimation:fadeInAnimation forKey:nil];
            [self.imgTransition removeFromSuperview];
            [[self view] setUserInteractionEnabled:YES];
        }];
        [self.imgTransition.layer addAnimation:moveUp forKey:nil];
    }[CATransaction commit];
}



-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
    [self.navigationController setNavigationBarHidden:YES];
    
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
 "CooperHewitt-Light",
 "CooperHewitt-Medium"
}
*/

- (IBAction)iniciarEstatistica:(id)sender {
    int totalExercicios = 14;
    int nAcertos = 12;
    
    //CALCULA A PORCENTAGEM DE ACERTOS
    float porcentagemAcertos = (nAcertos * 100) / totalExercicios;
    
    //CALCULA QUANTOS GRAUS REPRESENTA A PORCENTAGEM DE ACERTOS E ERROS
    float grausAcerto = (porcentagemAcertos * 360) / 100;
    float grausErro = 360 - grausAcerto;
    
    //CALCULA O GRAU EM QUE TERMINA OS GRAUS DE ACERTO
    float grauAcertoEnd = 450 - grausAcerto;
    float grauErroEnd = grauAcertoEnd - grausErro;
    
    float red = 145;
    float green = 186;
    float blue = 193;
    
    PieElement* newElem = [PieElement pieElementWithValue:(5 + arc4random() % 10) color:[UIColor colorWithRed:red / 255 green:green / 255 blue:blue / 255 alpha:1]];
    
    newElem.showTitle = YES;
    int insertIndex = arc4random() % (self.pieView.layer.values.count + 1);
    [self.pieView.layer insertValues:@[newElem] atIndexes:@[@(insertIndex)] animated:YES];
    
    self.pieView.layer.animationDuration = 0.6;
    self.pieView.layer.startAngle = 450;
    self.pieView.layer.endAngle = grauAcertoEnd;
    
    
    
    red = 157;
    green = 78;
    blue = 84;
    
    PieElement* newElem2 = [PieElement pieElementWithValue:(5 + arc4random() % 10) color:[UIColor colorWithRed:red / 255 green:green / 255 blue:blue / 255 alpha:1]];
    newElem2.showTitle = YES;
    int insertIndex2 = arc4random() % (self.pieView2.layer.values.count + 1);
    [self.pieView2.layer insertValues:@[newElem2] atIndexes:@[@(insertIndex2)] animated:YES];
    
    self.pieView2.layer.animationDuration = 2.5;
    self.pieView2.layer.startAngle = grauAcertoEnd;
    self.pieView2.layer.endAngle = grauErroEnd;

}
@end
