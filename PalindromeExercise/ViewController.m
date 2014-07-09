//
//  ViewController.m
//  PalindromeExercise
//
//  Created by Robert Figueras on 7/9/14.
//
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *myTextField;
@property (strong, nonatomic) IBOutlet UILabel *myResultsLabel;
@property (strong, nonatomic) IBOutlet UIButton *myButton;

@end

@implementation ViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.myTextField.delegate = self;
}


- (IBAction)onMyButtonTapped:(id)sender
{
    [self.myTextField resignFirstResponder];
    NSString *testString = self.myTextField.text;
    
//Remove all whitespace and non alpha numeric characters from string and put words into an array
    NSCharacterSet *nonCharacters = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
    NSArray *componentsOfStringWithoutPunct = [testString componentsSeparatedByCharactersInSet:nonCharacters];
    componentsOfStringWithoutPunct = [componentsOfStringWithoutPunct filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"self <> ''"]];
    
//Join all the words or letters into one string, all lowercase
    NSString *stringFromArrayJoinedTogether = [[componentsOfStringWithoutPunct componentsJoinedByString:@""]lowercaseString];

//Separate out each letter and add to an array
    NSMutableArray *arrayOfLetters = [NSMutableArray array];
    for (int i = 0; i<stringFromArrayJoinedTogether.length; i++) {
        NSString *currentLetter = [NSString stringWithFormat:@"%C",[stringFromArrayJoinedTogether characterAtIndex:i]];
        [arrayOfLetters addObject:currentLetter];
    }
    
//Pass array to test it
    if (testString.length == 0) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Missing Data" message:@"Please enter in text into the text field" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
    else
    {
        [self testArrayForPalindrome:arrayOfLetters];
    }
}


- (void) testArrayForPalindrome: (NSMutableArray *)arrayOfCharactersToTest
{
    NSMutableArray *firstHalfArray = [[NSMutableArray alloc] init];
    NSMutableArray *secondHalfArray = [[NSMutableArray alloc] init];
    
//If there are an odd number of characters, remove the middle one
    if (arrayOfCharactersToTest.count % 2 )
    {
        [arrayOfCharactersToTest removeObject:[arrayOfCharactersToTest objectAtIndex:arrayOfCharactersToTest.count/2+0.5]];
    }

//Separate characters into two equal halved arrays
    for (int i = 0; i < arrayOfCharactersToTest.count; i++)
    {
        if (i<(arrayOfCharactersToTest.count/2)) {
            [firstHalfArray addObject:[arrayOfCharactersToTest objectAtIndex:i]];
        }
        else
        {
            [secondHalfArray addObject:[arrayOfCharactersToTest objectAtIndex:i]];
        }
    }
    
//Reverse the second half array
    NSMutableArray *reversedSecondHalfArray = [NSMutableArray array];
    for (NSString *eachString in [secondHalfArray reverseObjectEnumerator])
    {
        [reversedSecondHalfArray addObject:eachString];
    }

//Compare the arrays
    if ([firstHalfArray isEqualToArray:reversedSecondHalfArray])
    {
        self.myResultsLabel.text = @"TRUE";
    }
    else{
        self.myResultsLabel.text = @"FALSE";
    }

}

@end
