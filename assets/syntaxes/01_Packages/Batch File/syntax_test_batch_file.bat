:: SYNTAX TEST "Packages/Kitch File/Kitch File.sublime-syntax"

   REM I'm a (com|ment)
:: ^^^                  keyword.command.rem.doskitch
::     ^^^^^^^^^^^^^^^^ comment.line.rem.doskitch
::           ^          invalid.illegal.unexpected-character.doskitch
::               ^      invalid.illegal.unexpected-character.doskitch
::                    ^ invalid.illegal.unexpected-character.doskitch

REM
   not a comment
:: ^^^^^^^^^^^^^ - comment.line.rem.doskitch

REM This follows a REM command
:: <- keyword.command - comment
:: ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ comment.line

   :: Me too!
:: ^^         punctuation.definition.comment.doskitch
:: ^^^^^^^^^^ comment.line.colon.doskitch

   :+ Me too!
:: ^^         punctuation.definition.comment.doskitch

   := Me too!
:: ^^         punctuation.definition.comment.doskitch

   :, Me too!
:: ^^         punctuation.definition.comment.doskitch

   :; Me too!
:: ^^         punctuation.definition.comment.doskitch

   : Me too!
:: ^^         punctuation.definition.comment.doskitch

ECHO : Not a comment
::   ^^^^^^^^^^^^^^^ - comment

ECHO : Not a comment ^
  do not break out of an echo with an escaped newline
::   ^^^ - keyword.operator
::       ^^^^^ - keyword.command

ECHO &:: A comment
::   ^ keyword.operator.conditional.doskitch
::    ^^ punctuation.definition.comment.doskitch
::    ^^^^^^^^^^^^ comment.line.colon.doskitch

  :: an indented comment
::^^ punctuation.definition.comment.doskitch
::^^^^^^^^^^^^^^^^^^^^^^ comment.line.colon.doskitch

   ECHO "foo"
::      ^       punctuation.definition.string.begin.doskitch
::      ^^^^^   string.quoted.double.doskitch
::          ^   punctuation.definition.string.end.doskitch

ECHO "
::    ^ invalid.illegal.newline.doskitch

   @ECHO OFF
:: ^ keyword.operator.at.doskitch

   @
:: ^ - keyword.operator.at.doskitch

   GOTO:EOF
:: ^^^^ keyword.control.statement.doskitch
::     ^ punctuation.separator.doskitch
::      ^^^ keyword.control.flow.return.doskitch

   GOTO :End
:: ^^^^ keyword.control.statement.doskitch
::      ^ punctuation.separator.doskitch
::       ^^^ meta.function-call.doskitch variable.function.doskitch

   GOTO:End
:: ^^^^ keyword.control.statement.doskitch
::     ^ punctuation.separator.doskitch
::      ^^^ meta.function-call.doskitch variable.function.doskitch

:: Redirection
   ECHO Hello World! > hello.txt
:: ^^^^                keyword.command.doskitch
::                   ^ keyword.operator.redirection.doskitch

   ECHO >> NUL
::      ^^     keyword.operator.redirection.doskitch
::         ^^^ constant.language

   dir > f.txt 2>&1
::     ^ keyword.operator.redirection.doskitch
::              ^^ keyword.operator.redirection.doskitch

   ECHO || ECHO && ECHO &
::      ^^ keyword.operator.conditional.doskitch
::              ^^ keyword.operator.conditional.doskitch
::                      ^ keyword.operator.conditional.doskitch

:: Conditionals
   IF foo EQU bar
:: ^^         keyword.control.conditional.doskitch
::        ^^^ keyword.operator.comparison.doskitch

   IF NOT foo EQU bar
:: ^^             keyword.control.conditional.doskitch
::    ^^^         keyword.operator.logical.doskitch
::            ^^^ keyword.operator.comparison.doskitch


   IF %ERRORLEVEL% NEQ 0 EXIT /B 1
:: ^^              keyword.control.conditional.doskitch
::    ^^^^^^^^^^^^ variable.language.doskitch
::    ^ punctuation.definition.variable.begin.doskitch
::               ^ variable.language.doskitch punctuation.definition.variable.end.doskitch

   IF foo == bar
:: ^^         keyword.control.conditional.doskitch
::        ^^  keyword.operator.comparison.doskitch

   FOR %%G IN (0,9) DO (md %%G)
:: ^^^                 keyword.control.repeat.doskitch
::             ^       constant.numeric.integer.decimal.doskitch

   FIND "a" |
::          ^ keyword.operator.pipe.doskitch

  :This is a #%@$虎 strange label
::^    punctuation.separator.doskitch
:: ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ entity.name.label.doskitch

  :End
::^    punctuation.separator.doskitch
:: ^^^ entity.name.label.doskitch

   ECHO %1 %* %~dpf$PATH:5 %~1
::      ^ punctuation.definition.variable.doskitch
::      ^^ variable.parameter.doskitch
::         ^ punctuation.definition.variable.doskitch
::         ^^ variable.parameter.doskitch
::            ^ punctuation.definition.variable.doskitch
::            ^^^^^^^^^^^ variable.parameter.doskitch
::                         ^ punctuation.definition.variable.doskitch
::                         ^^^ variable.parameter.doskitch

   ECHO %variable% !variable!
::      ^ punctuation.definition.variable.begin.doskitch
::      ^^^^^^^^^^ variable.other.readwrite.doskitch
::               ^ punctuation.definition.variable.end.doskitch
::                 ^ punctuation.definition.variable.begin.doskitch
::                 ^^^^^^^^^^ variable.other.readwrite.doskitch
::                          ^ punctuation.definition.variable.end.doskitch

ECHO %sub:str1=str2% !sub:str1=str2!
::   ^^^^^^^^^^^^^^^ variable.other.readwrite.doskitch
::   ^ punctuation.definition.variable.begin.doskitch
::       ^ punctuation.separator.doskitch
::        ^^^^^^^^^ meta.variable.substitution.doskitch
::        ^^^^ string.unquoted.doskitch
::            ^ punctuation.separator.doskitch
::             ^^^^ string.unquoted.doskitch
::                 ^ punctuation.definition.variable.end.doskitch
::                   ^^^^^^^^^^^^^^^ variable.other.readwrite.doskitch
::                   ^ punctuation.definition.variable.begin.doskitch
::                       ^ punctuation.separator.doskitch
::                        ^^^^^^^^^ meta.variable.substitution.doskitch
::                        ^^^^ string.unquoted.doskitch
::                            ^ punctuation.separator.doskitch
::                             ^^^^ string.unquoted.doskitch
::                                 ^ punctuation.definition.variable.end.doskitch


ECHO %substr:~0,-2% !substr:~0,-2!
::   ^^^^^^^^^^^^^^ variable.other.readwrite.doskitch
::   ^ punctuation.definition.variable.begin.doskitch
::          ^^ punctuation.separator.doskitch
::            ^^^^ meta.variable.substring.doskitch
::            ^ constant.numeric.doskitch
::             ^ punctuation.separator.doskitch
::              ^^ constant.numeric.doskitch
::                ^ punctuation.definition.variable.end.doskitch
::                  ^^^^^^^^^^^^^^ variable.other.readwrite.doskitch
::                  ^ punctuation.definition.variable.begin.doskitch
::                         ^^ punctuation.separator.doskitch
::                           ^^^^ meta.variable.substring.doskitch
::                           ^ constant.numeric.doskitch
::                            ^ punctuation.separator.doskitch
::                             ^^ constant.numeric.doskitch
::                               ^ punctuation.definition.variable.end.doskitch

ECHO %b:~-5% !b:~+5!
::   ^^^^^^^ variable.other.readwrite.doskitch
::   ^ punctuation.definition.variable.begin.doskitch
::     ^^ punctuation.separator.doskitch
::       ^^ meta.variable.substring.doskitch
::       ^^ constant.numeric.doskitch
::         ^ punctuation.definition.variable.end.doskitch
::           ^^^^^^^ variable.other.readwrite.doskitch
::           ^ punctuation.definition.variable.begin.doskitch
::             ^^ punctuation.separator.doskitch
::               ^^ meta.variable.substring.doskitch
::               ^^ constant.numeric.doskitch
::                 ^ punctuation.definition.variable.end.doskitch

ECHO !t:%foo%=%bar:~0,-4%!
::   ^^^^^^^^^^^^^^^^^^^^^ variable.other.readwrite.doskitch
::   ^ punctuation.definition.variable.begin.doskitch
::      ^^^^^ meta.variable.substitution.doskitch variable.other.readwrite.doskitch
::      ^ meta.variable.substitution.doskitch punctuation.definition.variable.begin.doskitch
::          ^ meta.variable.substitution.doskitch punctuation.definition.variable.end.doskitch
::            ^ meta.variable.substitution.doskitch punctuation.definition.variable.begin.doskitch
::            ^^^^^^^^^^^ meta.variable.substitution.doskitch variable.other.readwrite.doskitch
::                  ^^^^ meta.variable.substitution.doskitch meta.variable.substring.doskitch
::                      ^ meta.variable.substitution.doskitch punctuation.definition.variable.end.doskitch
::                    ^^ meta.variable.substitution.doskitch constant.numeric.doskitch
::                       ^ punctuation.definition.variable.end.doskitch

ECHO %t:foo=!bar:~0,-4!%
::   ^^^^^^^^^^^^^^^^^^^ variable.other.readwrite.doskitch
::   ^ punctuation.definition.variable.begin.doskitch
::          ^ meta.variable.substitution.doskitch punctuation.definition.variable.begin.doskitch
::          ^^^^^^^^^^^ meta.variable.substitution.doskitch variable.other.readwrite.doskitch
::                ^^^^ meta.variable.substitution.doskitch meta.variable.substring.doskitch
::                    ^ meta.variable.substitution.doskitch punctuation.definition.variable.end.doskitch
::                  ^^ meta.variable.substitution.doskitch constant.numeric.doskitch
::                     ^ punctuation.definition.variable.end.doskitch

ECHO Not% a variable
::      ^^^^^^^^^^^^ - variable.other.readwrite.doskitch
::   ^^^             - keyword.operator.logical.doskitch

ECHO Not! a variable
::      ^^^^^^^^^^^^ - variable.other.readwrite.doskitch
::   ^^^             - keyword.operator.logical.doskitch

:: Numerics
SET /A r = 010 + 0x20 - 24
::         ^^^ constant.numeric.integer.octal.doskitch
::         ^ punctuation.definition.numeric.octal.doskitch
::               ^^^^ constant.numeric.integer.hexadecimal.doskitch
::               ^^ punctuation.definition.numeric.hexadecimal.doskitch
::                      ^^ constant.numeric.integer.decimal.doskitch

:: Escape Characters
ECHO %% ^^! ^&
::   ^^ constant.character.escape.doskitch
::      ^^^ constant.character.escape.doskitch
::          ^^ constant.character.escape.doskitch

:: command SET /A specific operators
   set /a "num%%=5"
::        ^^^^^^^^^ meta.expression.set.doskitch
::            ^^^ keyword.operator.assignment.augmented.doskitch

   set /a "num&=3"
::            ^^ keyword.operator.assignment.augmented.doskitch

   set /a "num*=5"
::            ^^ keyword.operator.assignment.augmented.doskitch

   set /a "num+=5"
::            ^^ keyword.operator.assignment.augmented.doskitch

   set /a "num-=5"
::            ^^ keyword.operator.assignment.augmented.doskitch

   set /a "num/=5"
::            ^^ keyword.operator.assignment.augmented.doskitch

   set /a "num<<=2"
::            ^^^ keyword.operator.assignment.augmented.doskitch

   set /a "num=!5"
::            ^ keyword.operator.assignment.doskitch
::             ^ keyword.operator.logical.doskitch

   set /a "num=(2+3)*5"
::             ^^^^^ meta.group.doskitch
::             ^ punctuation.section.group.begin.doskitch
::                 ^ punctuation.section.group.end.doskitch
::            ^ keyword.operator.assignment.doskitch
::               ^ keyword.operator.arithmetic.doskitch
::                  ^ keyword.operator.arithmetic.doskitch

   set /a "num=2,result=num*5"
::            ^ keyword.operator.assignment.doskitch
::              ^ punctuation.separator.doskitch
::                     ^ keyword.operator.assignment.doskitch
::                         ^ keyword.operator.arithmetic.doskitch

   set /a "num=2<<3"
::            ^ keyword.operator.assignment.doskitch
::              ^^ keyword.operator.arithmetic.doskitch

   set /a "num=2>>3"
::            ^ keyword.operator.assignment.doskitch
::              ^^ keyword.operator.arithmetic.doskitch

   set /a "num=5%%2"
::            ^ keyword.operator.assignment.doskitch
::              ^^ keyword.operator.arithmetic.doskitch

   set /a "num=5&3"
::            ^ keyword.operator.assignment.doskitch
::              ^ keyword.operator.arithmetic.doskitch

   set /a "num=5^3"
::            ^ keyword.operator.assignment.doskitch
::              ^ keyword.operator.arithmetic.doskitch

   set /a "num=5|3"
::            ^ keyword.operator.assignment.doskitch
::              ^ keyword.operator.arithmetic.doskitch

   set /a "num^=3"
::            ^^ keyword.operator.assignment.augmented.doskitch

   set /a "num=num*5"
::            ^ keyword.operator.assignment.doskitch
::                ^ keyword.operator.arithmetic.doskitch

   set /a "num=num+5"
::            ^ keyword.operator.assignment.doskitch
::                ^ keyword.operator.arithmetic.doskitch

   set /a "num=num-5"
::            ^ keyword.operator.assignment.doskitch
::                ^ keyword.operator.arithmetic.doskitch

   set /a "num=num/5"
::            ^ keyword.operator.assignment.doskitch
::                ^ keyword.operator.arithmetic.doskitch

   set /a "num=~5"
::            ^ keyword.operator.assignment.doskitch
::             ^ keyword.operator.arithmetic.doskitch

   set /a "num>>=2"
::            ^^^ keyword.operator.assignment.augmented.doskitch

   set /a "num|=3"
::            ^^ keyword.operator.assignment.augmented.doskitch

   set /a century=year/100, next=century+1
::               ^ keyword.operator.assignment.doskitch
::                    ^ keyword.operator.arithmetic.doskitch
::                        ^ punctuation.separator.doskitch
::                              ^ keyword.operator.assignment.doskitch
::                                      ^ keyword.operator.arithmetic.doskitch

  SET T=%TIME: =0%
::^^^ keyword.command
::    ^ variable.other.readwrite
::     ^ keyword.operator.assignment
::      ^^^^^^^^^^ variable.other.readwrite

IF "%FOO%" == "BAR" ( SET BAZ=42 )
::                  ^ punctuation.section.group.begin
::                  ^^^^^^^^^^^^^^ meta.group
::                               ^ punctuation.section.group.end
::                            ^^ string.unquoted

:: See http://ss64.com/nt/syntax-brackets.html
IF EXIST MyFile.txt (ECHO Some(more)Potatoes)
:: <- keyword.control
:: ^ keyword.other
::                  ^^^^^^^^^^^^^^^^ meta.group
::                   ^ keyword.command
::                                  ^ - meta.group

IF EXIST MyFile.txt (ECHO Some[more]Potatoes)
:: <- keyword.control
:: ^ keyword.other
::                  ^^^^^^^^^^^^^^^^^^^^^^^^^ meta.group
::                   ^ keyword.command

set "hello"="world"
:: <- keyword.command
::  ^ - variable.other.readwrite
::   ^^^^^^ variable.other.readwrite
::         ^ keyword.operator.assignment
::          ^ - punctuation
::                ^ punctuation.definition.string.end
::                 ^ - string

set foo=bar
:: <- keyword.command
::  ^^^ variable.other.readwrite
::     ^ keyword.operator.assignment
::      ^^^ string.unquoted

set  foo = bar
:: <- keyword.command
::  ^ - variable.other.readwrite
::   ^^^^ variable.other.readwrite
::       ^ keyword.operator.assignment
::         ^^^ string.unquoted

set  hello world = bar
:: <- keyword.command
::  ^ - variable.other.readwrite
::   ^^^^^^^^^^^^ variable.other.readwrite
::               ^ keyword.operator.assignment
::                 ^^^ string.unquoted

set abc /a = 1+2
:: <- keyword.command
::  ^^^^^^^ variable.other.readwrite
::         ^ keyword.operator.assignment - meta.expression.set
::           ^^^ string.unquoted

set "foobar=test"
:: <- keyword.command
::  ^ - variable.other.readwrite
::   ^^^^^^ variable.other.readwrite
::         ^ keyword.operator.assignment
::              ^ punctuation.definition.string.end

set  " foo = bar"
:: <- keyword.command
::   ^^ - variable.other.readwrite
::     ^^^^ variable.other.readwrite
::         ^ keyword.operator.assignment
::              ^ punctuation.definition.string.end

set test rem = hi
:: <- keyword.command
::       ^^^^^^^^^ - comment
::  ^^^^^^^^^ variable.other.readwrite
::           ^ keyword.operator.assignment
::             ^^ - variable.other

set hello_world
:: <- keyword.command
::  ^^^^^^^^^^^ variable.other.readwrite.doskitch

set /A hello_world
:: <- keyword.command
::     ^^^^^^^^^^^ meta.expression.set
::                ^ - meta.expression.set

powershell get-date -uformat "%%Y%%m%%d" > today.txt
::                           ^^^^^^^^^^^ string.quoted.double.doskitch
::                            ^^ constant.character.escape.doskitch
::                              ^ - constant.character.escape.doskitch
::                               ^^ constant.character.escape.doskitch
::                                 ^ - constant.character.escape.doskitch
::                                  ^^ constant.character.escape.doskitch
::                                    ^ - constant.character.escape.doskitch

:: the following example was inspired by http://stackoverflow.com/a/14634551/4473405
set /p today=<today.txt
:: ^^^^ - variable.other.readwrite.doskitch
::     ^^^^^ variable.other.readwrite.doskitch
::          ^ keyword.operator.assignment.doskitch
::           ^ keyword.operator.redirection.doskitch
ren example.txt example_%today%.txt
::                      ^ punctuation.definition.variable.begin.doskitch
::                      ^^^^^^^ variable.other.readwrite.doskitch
::                            ^ punctuation.definition.variable.end.doskitch

set /p today=enter a date:
:: ^^^^ - variable.other.readwrite.doskitch
::     ^^^^^ variable.other.readwrite.doskitch
::          ^ keyword.operator.assignment.doskitch
::           ^^^^^^^^^^^^^ meta.prompt.set.doskitch string.unquoted - variable.other.readwrite.doskitch
::                        ^ - meta.prompt.set.doskitch
set /p today=enter a date: REM :: this is not a comment
:: ^^^^ - variable.other.readwrite.doskitch
::     ^^^^^ variable.other.readwrite.doskitch
::          ^ keyword.operator.assignment.doskitch
::           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.prompt.set.doskitch string.unquoted - variable.other.readwrite.doskitch - comment
::                                                     ^ - meta.prompt.set.doskitch
set /p today=
:: ^^^^ - variable.other.readwrite.doskitch
::     ^^^^^ variable.other.readwrite.doskitch
::          ^ keyword.operator.assignment.doskitch
::           ^ - meta.prompt.set.doskitch

:: Double quotes after the equal sign, or part of a quoted assignment are literal chars
SET "XML=<foo bar="%ATTR1%" baz="prefix-%ATTR2%" />"
::  ^ punctuation.definition.string.begin
::                ^ - punctuation
::                 ^^^^^^^ variable.other.readwrite
::                        ^ - punctuation
::                              ^ - punctuation
::                                      ^^^^^^^ variable.other.readwrite
::                                             ^ - punctuation
::                                                 ^ punctuation.definition.string.end

set folder=%TEMP%\subfolder\
::  ^^^^^^ variable.other.readwrite.doskitch
::         ^^^^^^ variable.other.readwrite.doskitch
::               ^^^^^^^^^^^ string.unquoted - variable.other

set test="c:\program files (x86)\%example%_%%test"abc
::  ^^^^ variable.other.readwrite.doskitch
::      ^ keyword.operator.assignment.doskitch
::       ^ punctuation.definition.string.begin.doskitch
::       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.double.doskitch
::                               ^^^^^^^^^ variable.other.readwrite.doskitch
::                                         ^^ constant.character.escape.doskitch
::                                               ^ punctuation.definition.string.end.doskitch
::                                                ^^^ string.unquoted.doskitch

SETLOCAL EnableDelayedExpansion
::^^^^^^ keyword.command.doskitch
  SET /P example="what is the answer? ;) " & echo you have answered: !example!
::   ^^^^ - variable.other.readwrite.doskitch
::       ^^^^^^^ variable.other.readwrite.doskitch
::              ^ keyword.operator.assignment.doskitch
::               ^ punctuation.definition.string.begin.doskitch
::               ^^^^^^^^^^^^^^^^^^^^^^^^^ meta.prompt.set.doskitch string.quoted
::                                       ^ punctuation.definition.string.end.doskitch
::                                         ^ keyword.operator.conditional.doskitch - meta.prompt.set.doskitch - string
::                                           ^^^^ keyword.command.doskitch
::                                                                   ^^^^^^^^^ variable.other.readwrite.doskitch
ENDLOCAL
::^^^^^^ keyword.command.doskitch

set "X="
::  ^^^^ string.quoted.double
::  ^ punctuation.definition.string.begin
::   ^ variable.other.readwrite
::    ^ keyword.operator.assignment
::     ^ punctuation.definition.string.end
::      ^ - string

set /p OUTPUT="( ... )|&... "
::            ^^^^^^^^^^^^^^^ meta.prompt.set string.quoted.double - string.unquoted
set /p OUTPUT=hi|echo
::            ^^ meta.prompt.set string.unquoted
::              ^ keyword.operator.pipe - meta.prompt
::               ^^^^ keyword.command
set /p OUTPUT="( ... )|&... "ignored & echo
::            ^^^^^^^^^^^^^^^ meta.prompt.set string.quoted.double - string.unquoted
::                           ^^^^^^^ meta.prompt.set comment.line.ignored
::                                   ^ keyword.operator.conditional - comment
::                                     ^^^^ keyword.command
set /p today="enter a date: " REM :: this is a comment & echo !today!
:: ^^^^ - variable.other.readwrite.doskitch
::     ^^^^^ variable.other.readwrite.doskitch
::          ^ keyword.operator.assignment.doskitch - variable.other.readwrite.doskitch
::           ^^^^^^^^^^^^^^^^ meta.prompt.set.doskitch string.quoted - variable.other.readwrite.doskitch - comment
::                            ^^^^^^^^^^^^^^^^^^^^^^^^ comment
::                                                     ^ keyword.operator.conditional - comment - meta.prompt
::                                                       ^^^^ keyword.command
::                                                            ^^^^^^^ variable.other.readwrite

set hello=4
set wow=2
set /A hello*=wow*=2
::     ^^^^^ variable.other.readwrite
::          ^^ keyword.operator.assignment.augmented
::            ^^^ variable.other.readwrite
::               ^^ keyword.operator.assignment.augmented
::                 ^ constant.numeric.integer.decimal

set /A "hello*=wow"
::     ^^^^^^^^^^^^ meta.expression.set string.quoted.double
::     ^ punctuation.definition.string.begin
::      ^^^^^ variable.other.readwrite
::           ^^ keyword.operator.assignment.augmented
::                ^ punctuation.definition.string.end

set /A "%hello%+%wow%"
::     ^^^^^^^^^^^^^^^ meta.expression.set string.quoted.double
::     ^ punctuation.definition.string.begin
::      ^^^^^^^ variable.other.readwrite
::      ^ punctuation.definition.variable.begin
::            ^ punctuation.definition.variable.end
::             ^ keyword.operator.arithmetic
::              ^^^^^ variable.other.readwrite
::              ^ punctuation.definition.variable.begin
::               ^^^ variable.other.readwrite
::                  ^ punctuation.definition.variable.end
::                   ^ punctuation.definition.string.end
set /A "%hello%+wow"
::     ^^^^^^^^^^^^^ meta.expression.set string.quoted.double
::      ^^^^^^^ variable.other.readwrite
::      ^ punctuation.definition.variable.begin
::            ^ punctuation.definition.variable.end
::             ^ keyword.operator.arithmetic

set /A 1+"%hello%"
::     ^ constant.numeric.integer.decimal
::      ^ keyword.operator.arithmetic
::       ^^^^^^^^^ string.quoted.double
::       ^ punctuation.definition.string.begin
::        ^ punctuation.definition.variable.begin
::         ^^^^^ variable.other.readwrite
::              ^ punctuation.definition.variable.end
::               ^ punctuation.definition.string.end

set a12b=21
REM    the line below is actually invalid, as % is not expected to be used in variables before an augmented operator
set /a %a12b%*=2
::      ^^^^ variable.other.readwrite
::           ^^ keyword.operator.assignment.augmented
::             ^ constant.numeric.integer.decimal

set /a a12b*=2
::     ^^^^ variable.other.readwrite
::         ^^ keyword.operator.assignment.augmented
::           ^ constant.numeric.integer.decimal
set /a  a12b *= 2
::     ^ - variable
::      ^^^^ variable.other.readwrite
::          ^ - variable
::           ^^ meta.expression.set keyword.operator.assignment.augmented
::              ^ constant.numeric.integer.decimal

set /a ! a12b
::     ^ keyword.operator.logical
::       ^^^^ variable.other.readwrite
set /a !a12b
::     ^ keyword.operator.logical
::      ^^^^ variable.other.readwrite
set /a "! a12b"
::     ^^^^^^^^ meta.expression.set string.quoted.double
::     ^ punctuation.definition.string.begin
::      ^ keyword.operator.logical
::        ^^^^ variable.other.readwrite
::            ^ punctuation.definition.string.end
set /a "! %a12b%"
::     ^^^^^^^^^^ meta.expression.set string.quoted.double
::     ^ punctuation.definition.string.begin
::      ^ keyword.operator.logical
::        ^^^^^^ variable.other.readwrite
::        ^ punctuation.definition.variable.begin
::             ^ punctuation.definition.variable.end
::              ^ punctuation.definition.string.end
set /a ! "a12b"
::     ^ keyword.operator.logical
::       ^ punctuation.definition.string.begin
::        ^^^^ variable.other.readwrite
::            ^ punctuation.definition.string.end
set /a !"%a12b%"
::     ^ keyword.operator.logical
::      ^ punctuation.definition.string.begin
::       ^^^^^^ variable.other.readwrite
::             ^ punctuation.definition.string.end

set /a a&=a12b
::      ^ keyword.operator.conditional - meta.expression.set
set /a " world"=12
::     ^^^^^^^^ string.quoted.double
::       ^^^^^ variable.other.readwrite
::            ^ punctuation.definition.string.end
::             ^ keyword.operator.assignment
::              ^^ constant.numeric.integer.decimal

set /a "wow"+="2"
::     ^^^^^  string.quoted.double
::      ^^^ variable.other.readwrite
::          ^^ keyword.operator.assignment.augmented - string
::            ^^^ string.quoted.double
::             ^ constant.numeric.integer.decimal 
set /a wow"+="2
::     ^^^ variable.other.readwrite
::        ^^^^ string.quoted.double
::         ^^ keyword.operator.assignment.augmented
::            ^ constant.numeric.integer.decimal - string
set /a 4*"2+-wow+(3"-2)
::     ^^^^^^^^^^^^^^^^ meta.expression.set - string string - meta.group meta.group
::     ^ constant.numeric.integer.decimal
::      ^ keyword.operator.arithmetic
::       ^^^^^^^^^^^ string.quoted.double
::       ^ punctuation.definition.string.begin
::        ^ constant.numeric.integer.decimal
::         ^^ keyword.operator.arithmetic
::           ^^^ variable.other.readwrite
::              ^ keyword.operator.arithmetic
::               ^^^^^^ meta.group
::               ^ punctuation.section.group.begin
::                ^ constant.numeric.integer.decimal
::                 ^ punctuation.definition.string.end
::                  ^ keyword.operator.arithmetic
::                   ^ constant.numeric.integer.decimal
::                    ^ punctuation.section.group.end
::                  ^^^ - string
::               ^^^ string.quoted.double meta.group

set /a (8"2")
::     ^^^^^^ meta.group
::     ^ punctuation.section.group.begin
::      ^ constant.numeric.integer.decimal
::       ^ punctuation.definition.string.begin
::       ^^^ string.quoted.double
::        ^ constant.numeric.integer.decimal
::         ^ punctuation.definition.string.end
::          ^ punctuation.section.group.end

set /a 4*"2+1"1
::     ^ constant.numeric.integer.decimal
::      ^ keyword.operator.arithmetic
::       ^^^^^ string.quoted.double
::        ^ constant.numeric.integer.decimal
::         ^ keyword.operator.arithmetic
::          ^ constant.numeric.integer.decimal
::            ^ constant.numeric.integer.decimal
set /a 4*"2++1"
::     ^ constant.numeric.integer.decimal
::      ^ keyword.operator.arithmetic
::       ^^^^^^ string.quoted.double
::        ^ constant.numeric.integer.decimal
::         ^^ keyword.operator.arithmetic
::           ^ constant.numeric.integer.decimal
set /a 4*"2++w"ow
::       ^^^^^^ string.quoted.double
::        ^ constant.numeric.integer.decimal
::         ^^ keyword.operator.arithmetic
::           ^ variable.other.readwrite
::             ^^ variable.other.readwrite
set /a (8"2")^^1
::           ^ constant.character.escape
::            ^ keyword.operator.arithmetic
set /a (8"2")^
+1
:: <- keyword.operator.arithmetic
set /a (abc*(def-(2))/4)"+((1))"
::     ^^^^^^^^^^^^^^^^^ meta.group
::                      ^ - meta.group
::          ^^^^^^^^^ meta.group meta.group
::               ^^^ meta.group meta.group meta.group
::     ^ punctuation.section.group.begin
::      ^^^ variable.other.readwrite
::         ^ keyword.operator.arithmetic
::          ^ punctuation.section.group.begin
::           ^^^ variable.other.readwrite
::              ^ keyword.operator.arithmetic
::               ^ punctuation.section.group.begin
::                ^ constant.numeric.integer.decimal
::                 ^ punctuation.section.group.end
::                  ^ punctuation.section.group.end
::                   ^ keyword.operator.arithmetic
::                    ^ constant.numeric.integer.decimal
::                     ^ punctuation.section.group.end
::                      ^^^^^^^^ string.quoted.double
::                      ^ punctuation.definition.string.begin
::                       ^ keyword.operator.arithmetic
::                        ^ meta.group punctuation.section.group.begin
::                         ^ meta.group meta.group punctuation.section.group.begin
::                          ^ meta.group meta.group constant.numeric.integer.decimal
::                           ^ meta.group meta.group punctuation.section.group.end
::                            ^ meta.group punctuation.section.group.end
::                             ^ punctuation.definition.string.end - meta.group
set /a ("a"+b&"c+d")
::     ^^^^^^ meta.expression.set meta.group
::      ^^^ string.quoted.double
::       ^ variable.other.readwrite
::         ^ keyword.operator.arithmetic
::          ^ variable.other.readwrite
::           ^ keyword.operator.conditional
::            ^^^^^ string.quoted.double - keyword - variable
set /a (a+"b)*2"-1
::     ^^^^^^ meta.group
::     ^ punctuation.section.group.begin
::      ^ variable.other.readwrite
::       ^ keyword.operator.arithmetic
::        ^ punctuation.definition.string.begin
::        ^^^^^^ string.quoted.double
::         ^ variable.other.readwrite
::          ^ punctuation.section.group.end
::           ^ keyword.operator.arithmetic - meta.group
::            ^ constant.numeric.integer.decimal
::             ^ punctuation.definition.string.end
::              ^ keyword.operator.arithmetic - meta.group
::               ^ constant.numeric.integer.decimal
