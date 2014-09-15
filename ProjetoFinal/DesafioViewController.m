//
//  DesafioViewController.m
//  ProjetoFinal
//
//  Created by ANDRE NORIYUKI TOKUNAGA on 12/09/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "DesafioViewController.h"

@interface DesafioViewController ()

@end

@implementation DesafioViewController

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
    
    self.desafioAtual = [[Desafio alloc] initWithLevel:2 andType:@"logico" andTasks:10];
    self.lblParte1.text = [self.desafioAtual parte1];
    self.lblOperador.text = [self.desafioAtual operador];
    self.lblParte2.text = [self.desafioAtual parte2];
    self.lblResultado.text = [self.desafioAtual resultado];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)acaoBotao1:(id)sender {
    [self alteraValores];
}

- (IBAction)acaoBotao2:(id)sender {
}

-(void)alteraValores{
    
    if ([self.desafioAtual incrementaTarefa]) {
        self.lblParte1.text = [self.desafioAtual parte1];
        self.lblOperador.text = [self.desafioAtual operador];
        self.lblParte2.text = [self.desafioAtual parte2];
        self.lblResultado.text = [self.desafioAtual resultado];
    }else{
        NSLog(@"Fim");
    }
    
    

}
@end
