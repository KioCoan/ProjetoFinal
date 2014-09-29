//
//  MenuPrincipalViewController.m
//  ProjetoFinal
//
//  Created by Rafael Aparecido de Freitas on 11/09/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "MenuPrincipalViewController.h"
#import "Expressao.h"

@interface MenuPrincipalViewController ()

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
    
    CGPoint posicaoAtual = self.imgTransition.frame.origin;
    
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"position.y"];
    anima.fromValue = [NSValue valueWithCGPoint:posicaoAtual];
    
    posicaoAtual.y = posicaoAtual.y + (self.imgTransition.frame.size.height / 2);
    
    anima.toValue    = [NSValue valueWithCGPoint:posicaoAtual];
    anima.duration   = 1.5f;
    anima.repeatCount =1;
    anima.removedOnCompletion = YES;
    
    [[self.imgTransition layer] addAnimation:anima forKey:nil];
    
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

@end
