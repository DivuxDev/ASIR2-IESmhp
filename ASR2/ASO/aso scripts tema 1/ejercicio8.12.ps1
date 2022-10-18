# Define the substrings and a sentence to test against
$Substrings = "a","e","i"
$Sentence   = "a long long sentence to test the -split approach, anticipating false positives"

# Construct the regex pattern
# The \b sequence ensures "word boundaries" on either side of a 
# match so that "a" wont match the a in "man" for example
$Pattern = "\b(?:{0})\b" -f ($Substrings -join '|')

# Split the string, count result and subtract 1
$Count = ($Sentence -split $Pattern).Count - 1
$Count