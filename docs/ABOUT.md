# About

`Sed` is a traditional tool and a programming language on Unix systems used to perform text transformations on an input stream (a file or input from a pipeline), making only one pass over the input(s), reading the text line by line. This track focus `sed` as a programming language.

## Main Features
+ Substitution command `s/<REGEX>/[REPLACEMENT]/[FLAGS]`.
+ [Regular Expressions][regex-wiki].
+ Two variables: **pattern space** and **hold space**.
+ Flow control using goto-like instructions, *regexps* and line addresses.

## Variants
`Sed` was developed in 1974 and has some classic implementations. This track will use [GNU Sed][sed-home] implementation along with all *GNU* extensions and [ERE (Extended Regular Expression)][ere-info].

[regex-wiki]: https://en.wikipedia.org/wiki/Regular_expression
[sed-home]: https://www.gnu.org/software/sed/
[ere-info]: https://www.gnu.org/software/sed/manual/html_node/ERE-syntax.html#ERE-syntax
