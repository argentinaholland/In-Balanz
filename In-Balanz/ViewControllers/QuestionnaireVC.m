//
//  QuestionnaireVC.m
//  In-Balanz
//
//  Created by Matias Altalef on 8/4/12.
//  Copyright (c) 2012 Burnt Soap. All rights reserved.
//

#import "QuestionnaireVC.h"
#import "QuestionnaireDoneVC.h"

#define kNameKey @"name"
#define kAnswerKey @"answer"
#define kAnswerSwitchTag 53

@interface QuestionnaireVC () {
    IBOutlet UITableView *table;
}

@property(nonatomic, retain) NSMutableArray *questions;
@property(nonatomic, retain) NSString *questionsPath;

@end

@implementation QuestionnaireVC

@synthesize questions = _questions, questionsPath = _questionsPath;

- (void)dealloc
{
    [_questions release], _questions = nil;
    [_questionsPath release], _questionsPath = nil;
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Klachtenlijst";
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc]
                                               initWithTitle:@"gedaan"
                                               style:UIBarButtonItemStyleDone
                                               target:self
                                               action:@selector(doneSelected)]
                                              autorelease];
    
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)
                      objectAtIndex:0];
    self.questionsPath = [documentsPath stringByAppendingPathComponent:@"questions.plist"];
    
    BOOL questionsFileCreated = [[NSFileManager defaultManager] fileExistsAtPath:_questionsPath];
    
    NSString *plistReadPath = questionsFileCreated ?
                                _questionsPath :
                                [[NSBundle mainBundle] pathForResource:@"questions" ofType:@"plist"];

    
    self.questions = [NSMutableArray arrayWithContentsOfFile:plistReadPath];
    
    if (!questionsFileCreated)
        [_questions writeToFile:_questionsPath atomically:YES];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_questions count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdenfifier = @"questionCell";
    NSDictionary *question = [_questions objectAtIndex:indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdenfifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdenfifier] autorelease];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        CGSize s = cell.bounds.size;
        
        UISwitch *answerSwitch = [[UISwitch alloc] init];
        answerSwitch.tag = kAnswerSwitchTag;
        [answerSwitch addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
        CGFloat switchWidth = answerSwitch.bounds.size.width;
        answerSwitch.center = CGPointMake(s.width - 0.5 * switchWidth - 10,
                                          0.5 * s.height);
        [cell addSubview:answerSwitch];
        [answerSwitch release];
    }
    
    cell.textLabel.text = [question objectForKey:kNameKey];
    UISwitch *answerSwitch = (UISwitch *)[cell viewWithTag:kAnswerSwitchTag];
    answerSwitch.on = [[question objectForKey:kAnswerKey] boolValue];

    return cell;
}

- (IBAction)switchChanged:(UISwitch *)sender {
    UITableViewCell *cell = (UITableViewCell *)sender.superview;
    NSIndexPath *indexPath = [(UITableView *)cell.superview indexPathForCell:cell];
    NSMutableDictionary *question = [_questions objectAtIndex:indexPath.row];
    [question setObject:[NSNumber numberWithBool:sender.on] forKey:kAnswerKey];
    
    // save to disk
    [_questions writeToFile:_questionsPath atomically:YES];
}

- (IBAction)doneSelected {
    CGFloat total = 0;
    for (NSDictionary *question in _questions) {
        if ([[question valueForKey:kAnswerKey] boolValue])
            total++;
    }
    
    [self pushVC:[QuestionnaireDoneVC class]];
    QuestionnaireDoneVC *doneVC = self.navigationController.topViewController;
    doneVC.result = total / [_questions count] > 5.0 / 7;
}

@end
