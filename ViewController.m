//
//  ViewController.m
//  Attributor
//
//  Created by Vamsi Varma on 15/09/14.
//  Copyright (c) 2014 Divami Software Pvt Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *body;
@property (weak, nonatomic) IBOutlet UILabel *headline;
@property (weak, nonatomic) IBOutlet UIButton *outlineBtn;
@property (weak, nonatomic) IBOutlet UIButton *unoutlineBtn;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString: self.outlineBtn.currentTitle];
    [title setAttributes:@{ NSStrokeWidthAttributeName : @3,
                             NSStrokeColorAttributeName : self.outlineBtn.tintColor}
                    range:NSMakeRange(0, [title length])];
    [self.outlineBtn setAttributedTitle:title forState:UIControlStateNormal];
}

- (IBAction)changeBodySelectionColorToMatchBackgroundOfButton:(UIButton *)sender {
    [self.body.textStorage addAttribute:NSForegroundColorAttributeName value:sender.backgroundColor range: self.body.selectedRange];
}
- (IBAction)outlineBodySelection {
        //Stroke Width and Color of the letter
        [self.body.textStorage addAttributes:@{ NSStrokeWidthAttributeName : @-3,
                                                NSStrokeColorAttributeName : self.outlineBtn.tintColor}
                                       range: self.body.selectedRange];
}

- (IBAction)unoutlineBodySelection {
    [self.body.textStorage removeAttribute:NSStrokeWidthAttributeName range:self.body.selectedRange];
}




@end
