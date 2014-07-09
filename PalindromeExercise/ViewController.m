//
//  ViewController.m
//  PalindromeExercise
//
//  Created by Robert Figueras on 7/9/14.
//
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *myTextField;
@property (strong, nonatomic) IBOutlet UILabel *myResultsLabel;
@property (strong, nonatomic) IBOutlet UIButton *myButton;

@end

@implementation ViewController


- (IBAction)onMyButtonTapped:(id)sender
{
    NSString *testString = self.myTextField.text;
    
//Remove all whitespace and non alpha numeric characters from string and put words into an array
    
    NSCharacterSet *nonCharacters = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
    NSArray *componentsOfStringWithoutPunct = [testString componentsSeparatedByCharactersInSet:nonCharacters];
    componentsOfStringWithoutPunct = [componentsOfStringWithoutPunct filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"self <> ''"]];
    
//Join all the words or letters into one string

    NSString *stringFromArrayJoinedTogether = [componentsOfStringWithoutPunct componentsJoinedByString:@""];
    
//Separate out each letter and add to an array
    
    NSMutableArray *arrayOfLetters = [NSMutableArray array];
    for (int i = 0; i<stringFromArrayJoinedTogether.length; i++) {
        NSString *currentLetter = [NSString stringWithFormat:@"%C",[stringFromArrayJoinedTogether characterAtIndex:i]];
        [arrayOfLetters addObject:currentLetter];
    }
    
//Pass array to test it
    
    [self testArrayForPalindrome:arrayOfLetters];
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
    
    for (NSString *eachString in [secondHalfArray reverseObjectEnumerator]) {
        [reversedSecondHalfArray addObject:eachString];
    }
    
    NSLog(@"firstHalfArray %@", firstHalfArray);
    NSLog(@"reversedSecondHalfArray %@", reversedSecondHalfArray);

}

@end
