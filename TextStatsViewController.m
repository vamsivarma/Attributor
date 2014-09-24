//
//  TextStatsViewController.m
//  Attributor
//
//  Created by Vamsi Varma on 22/09/14.
//  Copyright (c) 2014 Divami Software Pvt Ltd. All rights reserved.
//

#import "TextStatsViewController.h"

@interface TextStatsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *colorfulCharactersLabel;
@property (weak, nonatomic) IBOutlet UILabel *outlinedCharactersLabel;

@end

@implementation TextStatsViewController


//Independent testing of the MVC with out any segue
//Here we pass a hard coded model(string "test") to the View and check whether the logic is working or not.
/*- (void)viewDidLoad
{
    [super viewDidLoad];
    self.textToAnalyze = [[NSAttributedString alloc] initWithString:@"test" attributes:@{ NSForegroundColorAttributeName: [UIColor greenColor], NSStrokeWidthAttributeName : @-3} ];
}*/

-(void) setTextToAnalyze:(NSAttributedString *)textToAnalyze {
    //This is the model for our MVC
    _textToAnalyze = textToAnalyze;
    if(self.view.window) [self updateUI];
}

-(void) viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [self updateUI];
}

-(void) updateUI {
    self.colorfulCharactersLabel.text = [NSString stringWithFormat:@"%d colorful characters", [[self charactersWithAttribute:NSForegroundColorAttributeName] length]];
                                         
    self.outlinedCharactersLabel.text = [NSString stringWithFormat:@"%d outlined characters", [[self charactersWithAttribute:NSStrokeWidthAttributeName] length]];
}

- (NSAttributedString *) charactersWithAttribute:(NSString *) attributeName {
    
    NSMutableAttributedString *characters = [[NSMutableAttributedString alloc] init];
    
    int index = 0;
    while (index < [self.textToAnalyze length]) {
        NSRange range;
        id value = [self.textToAnalyze attribute:attributeName atIndex:index effectiveRange:&range];
        if(value) {
            [characters appendAttributedString:[self.textToAnalyze attributedSubstringFromRange:range]];
            index = range.location + range.length;
        } else {
            index++;
        }
    }
    
    return characters;
    
}

@end
