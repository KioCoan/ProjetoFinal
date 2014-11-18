//
//  ViewController.m
//  MagicPie
//
//  Created by Alexandr on 30.09.13.
//  Copyright (c) 2013 Alexandr Corporation. All rights reserved.
//

#import "Example1Controller.h"
#import "MagicPieLayer.h"
#import "EstatisticaPieView.h"
#import "NSMutableArray+pieEx.h"

#define LOG_ACTION

@interface Example1Controller()
@property (nonatomic, weak) IBOutlet EstatisticaPieView* pieView;
@property EstatisticaPieView* pieView2;
@end

@implementation Example1Controller
@synthesize pieView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    pieView.elemTapped = ^(PieElement* elem){
        [PieElement animateChanges:^{
            elem.color = [self randomColor];
        }];
    };
    
    
    CGRect frame = self.pieView.frame;
    frame.origin.y += 44;
    
    self.pieView2 = [[EstatisticaPieView alloc] initWithFrame:frame];
    [self.pieView2 setBackgroundColor:[UIColor clearColor]];
    [[self view] addSubview:self.pieView2];
}

- (UIColor*)randomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}


- (IBAction)addPressed:(id)sender
{
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
    
#ifdef LOG_ACTION
    NSLog(@"Insert values %@ to indixes %@", [self arrDesc:@[newElem]], [self arrDesc:@[@(insertIndex)]]);
#endif
}

- (IBAction)deletePressed:(id)sender
{
    if(self.pieView.layer.values.count <= 0)
        return;
    
    int deleteIndex = arc4random() % self.pieView.layer.values.count;
    [self.pieView.layer deleteValues:@[self.pieView.layer.values[deleteIndex]] animated:YES];
#ifdef LOG_ACTION
    NSLog(@"Delete values at indixes %@", [self arrDesc:@[@(deleteIndex)]]);
#endif
}

- (IBAction)animateChangeVal:(id)sender
{
    if(self.pieView.layer.values.count == 0)return;
    NSUInteger randCount = MAX(MIN(self.pieView.layer.values.count, 2), arc4random() % self.pieView.layer.values.count);
    NSMutableArray* randIndexes = [NSMutableArray new];
    NSMutableArray* changeValArr = [NSMutableArray new];
    [PieElement animateChanges:^{
        for(int i = 0; i < randCount; i++){
            int randIndx = arc4random() % self.pieView.layer.values.count;
            while ([randIndexes containsObject:@(randIndx)]) {
                randIndx = arc4random() % self.pieView.layer.values.count;
            }
            [randIndexes addObject:@(randIndx)];
            int randVal = (5 + arc4random() % 10);
            int prevVal = [(PieElement*)self.pieView.layer.values[randIndx] val];
            [self.pieView.layer.values[randIndx] setVal:randVal];
            [changeValArr addObject:[NSString stringWithFormat:@"%d -> %d", prevVal, randVal]];
        }
    }];
#ifdef LOG_ACTION
    NSMutableString* logStr = [[NSMutableString alloc] initWithString:@"Update elements:\n"];
    for(int i = 0; i < randIndexes.count; i++){
        [logStr appendFormat:@"%@ element: %@\n", randIndexes[i], changeValArr[i]];
    }
    NSLog(@"%@", logStr);
#endif
}

- (IBAction)refreshData:(id)sender
{
    [self.pieView.layer setNeedsDisplay];
}

- (IBAction)performRandomActions:(id)sender
{
    while (arc4random() % 100 < 90) {
        switch (arc4random() % 3) {
            case 0:
                [self addPressed:nil];
                break;
            case 1:
                [self deletePressed:nil];
                break;
            case 2:
                [self animateChangeVal:nil];
                break;
                
                
            default:
                break;
        }
    }
}

- (IBAction)animateStartEnd
{
    float startAngle = arc4random() % 360;
    float endAngle = arc4random() % 300 + 60 + startAngle;
    [self.pieView.layer setStartAngle:startAngle endAngle:endAngle animated:YES];
}

- (NSString*)arrDesc:(NSArray*)arr
{
    NSString* str = arr.description;
    str = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
    str = [str stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return str;
}


@end
