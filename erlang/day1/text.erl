-module(text).
-export([count_words/1]).

count_words("") -> 0;
count_words(Text) -> count_words(Text, 1).

count_words([_ | ""], WordCount) -> WordCount;
count_words([$\s | RemainingChars], WordCount) -> count_words(RemainingChars, WordCount + 1);
count_words([_ | RemainingChars], WordCount) -> count_words(RemainingChars, WordCount).
