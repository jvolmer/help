# 5-Minute-Brainwashing - Naming and Structuring Tests - Part 1
… test names describe requirements

Tests satisfy several needs in software development [3]. One of them is documenting the code and its intention. As a documentation, tests should be easy and quick to understand. To achieve that, tests should not only be written for the compiler or test writer, but for the people trying to understand the code [2]. Meaningful test names are what is most important for that, they serve as headlines for the test methods and provide a first hint to the content.

Test names that use the domain language to describe requirements improve the value and quality of tests. This article briefly describes how to name tests, and thus, improve their value and quality.

## Improving the value of tests
Tests are valuable because they can add domain knowledge, be a living documentation of the code and identify regression. 

Using domain language in code as often as possible results in a better alignment of requirements and code. Test names are one of the rare possibilities to include full sentences inside the code. Describing requirements in the domain language moves the requirements into the code while still being readable. This is a huge advantage for documentation and comprehension of the code.

*Use domain language in test names.*

Tests can be used as a living documentation of the production code because they test and thus show - in the best case - all requirements of the code. With descriptive names, the test names can be used as a menu for the capability of the unit under test.

*When starting to write tests for new classes, write down all requirements for the class as single sentences in the domain language. Then use these sentences as test names for the class. This forms a solid basis for implementing the tests and can be especially useful when using TDD.*

Failed tests identify regression quickly, without the need for manual debugging. Concise test names help the developer to understand the failure without the need to look into the test method. Easily readable test names improve this understanding. E.g., the readability of the test `aShuffledDeckIsInRandomOrder` can be improved by the name `a shuffled deck is in random order`. 

*If possible, use strings as names (e.g. in Javascript or Kotlin), otherwise snake case is probably the best alternative.*

## Improve the quality of tests
Only high-quality tests are able to provide the above mentioned values. Important qualities are short and concise test methods, as well as testing for code intention instead of implementation. 

Short tests of one specific requirement are not only easier to understand, they are especially helpful in identifying regression. Test names in the domain language lead to more concise tests because the name specifies exactly what the test is about and therefore restricts the test content. Names like `testShuffling` or `testShufflingIsCorrect` are not very specific and could test several requirements in one method. More specific requirements and descriptive test names are `a shuffled deck includes the same cards as the original deck` or `a shuffled deck is in random order`. Defining the specific name up front narrows down the task of the test and results in a concise test.

*Don't use the word 'test' in the test name, it results in overloaded tests. It can be helpful to start with the words 'must' or 'should' and complete the sentence with the unit under test as the implicit subject by describing the requirement.*

To ensure that the code exactly satisfies the requirements, tests should test the intention of the code and not test the implementation itself. Using names that describe the requirement in the domain language without using implementation details result in tests for code intention. Naming policies like `methodName_expectedResult_whenInput`, e.g. `shuffle_deckContainsValidDeck_validDeck` leak implementation details like method name and return value of the method. This is unnecessary and duplicate information from the content of the test method and does not show the explicit requirement. The name `a shuffled deck includes the same cards as the original deck` exactly describes a requirement without showing any implementation details.

*Test names should describe requirements to the unit under test, not use any implementation details and not follow a rigid naming policy. Filler words like ‘given’, ‘when’ or ‘then’ can be helpful to come up with a name but make the name less readable.*

## Conclusion
All in all, test names that describe requirements in the domain language improve the value and quality tests. They result in tests written for people that are easily understandable, provide documentation of the code and its intention, add domain knowledge to the code and identify regression quickly. Thus, they lead to a more effective software development process.


--


[1] Steve Freeman & Nat Pryce - Growing Object-Oriented Software, Guided by Tests


[2] Gerard Meszaros - “Write Tests for People” in 97 Things Every Programmer Should Know


[3] Sarah Mei - “Five Factor Testing” - https://madeintandem.com/blog/five-factor-testing/ 


[4] Kevlin Henney - Programming with GUTs - Build Stuff 2016 - https://youtu.be/azoucC_fwzw


[5] Vladimir Khorikov - You are naming your tests wrong! - https://enterprisecraftsmanship.com/posts/you-naming-tests-wrong/


[6] Tomek Kaczanowski - Bad Tests, Good Tests - https://leanpub.com/badtestsgoodtests
