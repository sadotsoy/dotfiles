syn case match
syn spell default

" orphans
" TODO: generator functions in any context
" TODO: switch()
" TODO: operators/comparisons
" TODO: builtins

" TODO: review all features and make sure stuff is wrapped in checks for the ES version
let s:bufname = bufname('')
let s:defaults = {
      \ 'javascript_es5':        1,
      \ 'javascript_es6':        1,
      \ 'javascript_es2017':     1,
      \ 'javascript_jsx':        (s:bufname =~ '\.[tj]sx\>'),
      \ 'javascript_typescript': (s:bufname =~ '\.tsx\?$'),
      \ }
for [s:name, s:default] in items(s:defaults)
  if !exists('b:'.s:name)
    let b:[s:name] = s:default
  endif
endfor


" {{{ clusters

  " jsClExpr - for any expression
  " jsClAfterValue
  " jsClImportExport - import / export statements - these aren't allowed at
  "                    the top level
  " jsClExtendable - things that can be extended - this is slightly different when typescript enabled
  " tsClSimpleTypes - simple TS types
  " tsClTypeHere - reference to a type, or a simple type
  " jsClInsideClass - things that go inside a class body
  syn cluster tsClTypeHere add=@tsClSimpleTypes

" }}}

" {{{ highlight groups

  " syntax errors
  hi! link jsSyntaxError IncSearch

" }}}

" {{{ errors - lowest precedence

  " out-of-place semicolon
  syn match jsErrorSemicolon contained /;/
  hi! link jsErrorSemicolon jsSyntaxError

  " out-of-place comma
  syn match jsErrorComma contained /,/
  hi! link jsErrorComma jsSyntaxError

  " unexpected closing brace, close bracket, close parens
  syn match jsErrorCloseBrace  contained /}/
  syn match jsErrorCloseSquare /]/
  syn match jsErrorCloseParen  /)/
  syn cluster jsClTop add=jsErrorCloseSquare,jsErrorCloseParen
  hi! link jsErrorCloseBrace  jsSyntaxError
  hi! link jsErrorCloseSquare jsSyntaxError
  hi! link jsErrorCloseParen  jsSyntaxError

  " unexpected assignment
  syn match jsErrorAssign contained /==\@!/
  hi! link jsErrorAssign jsSyntaxError

  " keywords that are used out of place
  syn keyword jsKeywordError in instanceof
  syn match jsKeywordError /\<\%(import\|export\)\>/
  syn cluster jsClTop add=jsKeywordError
  hi! link jsKeywordError jsSyntaxError

" }}}

" {{{ collect import/export names from the file!

  hi! link jsUserIdentifier Identifier

  function! <SID>CollectGlobalNames()
    let l:wordlist = {}

    " bufnum, lnum, col, off
    let l:oldpos = getpos('.')
    try
      call cursor(1, 1)

      " look for top-level import statements
      let l:start = 0
      while l:start <= line('$')
        call cursor(l:start, 1)
        let [l:line, l:col] = searchpos('^\s*import ', 'cnW', 0, 10)
        if l:line == 0
          break
        endif

        " set cursor to next line so we don't search endlessly
        let l:start = l:line + 1

        " grab everything after the word 'import'
        let l:imports = matchstr(getline(l:line), '^\s*import\s\+\zs.\{-}\ze\s\+from\>')

        " RegisterFirstWord() will add the first identifier, or <name> as identifier, or
        " * as <identifier> from l:imports
        while strlen(l:imports)
          let l:imports = <SID>RegisterFirstWord(l:imports, l:wordlist)
        endwhile
      endwhile

      " search again for typescript type definitions
      let l:start = 0
      while l:start <= line('$')
        call cursor(l:start, 1)
        let [l:line, l:col] = searchpos('^\s*\%(interface\|type\) ', 'cnW', 0, 10)
        if l:line == 0
          break
        endif

        " set cursor to next line so we don't search endlessly
        let l:start = l:line + 1

        " grab everything after the word 'interface'
        let l:name = matchstr(getline(l:line), '\c^\s*\%(interface\|type\)\s\+\zs[$a-z0-9_]\+')

        " add the name to our word list
        if strlen(l:name)
          let l:wordlist[l:name] = 1
        endif
      endwhile
    finally
      call setpos('.', l:oldpos)
    endtry

    " set up syntax keyword rules for the wordlist
    execute 'syn keyword jsUserIdentifier contained ' . join(keys(l:wordlist))
  endfunction

  function! <SID>RegisterFirstWord(input, wordlist)
    let l:input = a:input

    " strip a leading comma or opening parenthesis off the start
    let l:prefix = matchstr(l:input, '^\s*[,{]\s*')
    if strlen(l:prefix)
      let l:input = strpart(l:input, strlen(l:prefix))
    endif

    " strip '* as ' or '<identifier> as' off the start of the import string
    let l:prefix = matchstr(l:input, '^\s*\%(\%(\*\s*\|\w\+\s\+\)as\s\+\)\=')
    if strlen(l:prefix)
      let l:input = strpart(l:input, strlen(l:prefix))
    endif

    " match the word at the start of l:input
    let l:word = matchstr(l:input, '^\w\+')
    if strlen(l:word)
      let a:wordlist[l:word] = 1
      return strpart(l:input, strlen(l:word))
    endif
    return ''
  endfunction

  augroup JavascriptSyntax
  augroup end
  autocmd! JavascriptSyntax BufWritePost <buffer> call <SID>CollectGlobalNames()
  call <SID>CollectGlobalNames()

" }}}

" {{{ reserved words

  " TODO: finish implementing all of these
  syn keyword jsReservedWord
      \ catch
      \ with
      \ yield
      \ debugger
  syn match jsReservedWord /\<\%(try\|finally\|case\|default\)\>/
  syn cluster jsClTop add=jsReservedWord
  hi! link jsReservedWord IncSearch

" }}}

" {{{ comments

  syn region jsComment start=!//! end=/$/ oneline keepend extend
  syn region jsComment start=!/\*! end=!\*/! keepend extend
  syn cluster jsClTop add=jsComment
  hi! link jsComment Comment

" }}}

" {{{ expressions - normal dictionaries (first so they have lowest priority)

  syn region jsDictRegion matchgroup=jsDict start=/{/ end=/}/
        \ keepend extend contains=jsDictKey,jsDictKeySpecial,jsDictInlineFunc,jsDictComma,jsComment,jsErrorSemicolon,jsComment,jsGetter
  syn cluster jsClExpr add=jsDictRegion
  syn cluster jsClTop add=jsDictRegion
  hi! link jsDict Number

  syn match jsDictKey /\<[$A-Za-z0-9_]\+\_s*:/ contained nextgroup=@jsClExpr skipwhite skipnl
  syn match jsDictKey /\(['"]\)\%(\\.\|[^\\]\)\{-}\1:/ contained nextgroup=@jsClExpr skipwhite skipnl
  hi! link jsDictKey jsDict

  syn match jsDictKeySpecial contained /\(['"]\=\)__proto__\1\_s*:/ nextgroup=@jsClExpr skipwhite skipnl
  hi! link jsDictKeySpecial SpecialChar


  if b:javascript_es6
    syn region jsDictKey contained matchgroup=jsDict start=/\[/ end=/\]:/ keepend extend
          \ contains=@jsClExpr,jsErrorCloseBrace,jsErrorCloseParen,jsErrorSemicolon,jsErrorComma
          \ nextgroup=@jsClExpr skipwhite skipnl
  endif

  syn match jsDictInlineFunc /\<\h\w*\ze\_s*(/ contained nextgroup=jsFullFuncArgs skipwhite skipnl
  hi! link jsDictInlineFunc jsDictKey

  syn match jsDictComma contained /,/
  hi! link jsDictComma jsDict

  " ES5 getters/setters inside objects
  syn cluster jsClGetterError add=jsErrorCloseBrace,jsErrorComma,jsErrorAssign,jsErrorCloseSquare,jsErrorCloseParen
  syn cluster jsClGetterError add=jsGetterArgsError
  syn match jsGetter /\<get\>\%(\_s*:\)\@!/ contained nextgroup=jsGetterName,@jsClGetterError skipwhite skipnl
  syn match jsGetter /\<set\>\%(\_s*:\)\@!/ contained nextgroup=jsSetterName,@jsClGetterError skipwhite skipnl
  syn cluster jsClInsideClass add=jsGetter
  hi! link jsGetter Keyword

  syn match jsGetterName contained /\<[$A-Za-z_][$A-Za-z0-9_]*\>/ nextgroup=jsGetterArgs,@jsClGetterError skipwhite skipnl
  syn match jsSetterName contained /\<[$A-Za-z_][$A-Za-z0-9_]*\>/ nextgroup=jsSetterArgs,@jsClGetterError skipwhite skipnl
  if b:javascript_es6
    syn region jsGetterName contained matchgroup=jsGetter start=/\[/ end=/\]/ keepend extend nextgroup=jsGetterArgs,@jsClGetterError skipwhite skipnl
          \ contains=@jsClExpr,jsErrorSemicolon,jsErrorComma,jsErrorCloseBrace,jsErrorCloseParen
    syn region jsSetterName contained matchgroup=jsGetter start=/\[/ end=/\]/ keepend extend nextgroup=jsSetterArgs,@jsClGetterError skipwhite skipnl
          \ contains=@jsClExpr,jsErrorSemicolon,jsErrorComma,jsErrorCloseBrace,jsErrorCloseParen
  endif

  syn match jsGetterArgsError contained /(.\{-})/
  hi! link jsGetterArgsError jsSyntaxError

  syn match jsGetterArgs contained /(\_s*)/ extend nextgroup=jsGetterBody,@jsClGetterError,tsTypeFollowedByFullFuncBody skipwhite skipnl
  hi! link jsGetterArgs jsGetter
  syn match jsSetterArgs contained /([$A-Za-z_][$A-Za-z0-9_]*)/
        \ nextgroup=jsGetterBody,@jsClGetterError skipwhite skipnl
        \ contains=jsSetterArgParens
  syn match jsSetterArgParens contained /[()]/
  hi! link jsSetterArgParens jsGetter

  syn region jsGetterBody contained matchgroup=jsGetter start=/{/ end=/}/ keepend extend
        \ contains=@jsClTop,@jsClImportExport


" }}}

" {{{ lists, list-assignment

  hi! link jsList Typedef

  syn region jsListRegion matchgroup=jsList start=/\[/ end=/\]/ keepend extend
        \ contains=@jsClExpr,jsListComma,jsComment,jsErrorSemicolon
        \ nextgroup=@jsClAfterValue skipwhite skipnl
  syn cluster jsClExpr add=jsListRegion
  syn cluster jsClTop add=jsClTop
  syn match jsListComma /,/ contained
  hi! link jsListComma jsList


" }}}

" {{{ expressions - null/true/false/numbers

  syn keyword jsLiteralValue undefined null true false
        \ nextgroup=@jsClAfterValue skipwhite skipnl
  syn cluster jsClExpr add=jsLiteralValue
  syn cluster jsClTop add=jsClTop
  hi! link jsLiteralValue Typedef

  " decimal
  syn match jsNumber /\<\%(0\|[1-9]\d*\)\%(\.\d\+\)\=\>/ nextgroup=@jsClAfterValue skipwhite skipnl
  " octal
  syn match jsNumberOctal /\<0[0-7]\+\>/ nextgroup=@jsClAfterValue skipwhite skipnl
  if b:javascript_es6
    " binary
    syn match jsNumberBinary /\<0b[01]\+\>/ nextgroup=@jsClAfterValue skipwhite skipnl
  endif
  syn cluster jsClExpr add=jsNumber,jsNumberOctal,jsNumberBinary
  syn cluster jsClTop add=jsNumber,jsNumberOctal,jsNumberBinary
  hi! link jsNumber Statement
  hi! link jsNumberOctal Typedef
  hi! link jsNumberBinary SpecialChar


" }}}

" {{{ expressions - unary operators

  syn keyword jsOperator new typeof delete void nextgroup=@jsClExpr skipwhite skipnl
  syn match jsOperator /[!~]/ nextgroup=@jsClExpr skipwhite skipnl
  syn match jsOperator /\%(++\=\|--\=\)/ nextgroup=@jsClExpr skipwhite skipnl
  syn cluster jsClExpr add=jsOperator
  syn cluster jsClTop add=jsOperator
  hi! link jsOperator SpecialChar

  syn match jsPostIncrement contained /\%(++\|--\)/ nextgroup=@jsClExpr skipwhite skipnl
  syn cluster jsClAfterValue add=jsPostIncrement
  hi! link jsPostIncrement jsOperator


" }}}

" {{{ ternary operator

  syn region jsTernaryOperator matchgroup=Operator contained start=/?/ end=/:/ keepend extend
        \ contains=@jsClExpr,jsErrorSemicolon,jsErrorCloseBrace
        \ nextgroup=@jsClExpr skipwhite skipnl
  syn cluster jsClAfterValue add=jsTernaryOperator

" }}}

" {{{ expressions - dict-expansion: {var1, var2}

  " NOTE: jsDictAssign has the contained flag because it's not allowed to sit
  " by itself - it has to come after a 'var' option
  syn match jsDictAssign contained /{\_s*\w\+\_s*\%(,\_s*\w\+\_s*\)*}/ extend
        \ nextgroup=jsAssign skipwhite skipnl contains=jsIdentifier
  hi! link jsDictAssign jsVar

  " NOTE: jsListAssign is a top-level thing
  syn region jsListAssignRegion matchgroup=jsVar start=/\[/ end=/\]/ keepend extend
        \ nextgroup=jsAssign skipwhite skipnl
        \ contains=jsVarComma,jsSplat,jsIdentifier
  syn match jsSplat contained /\.\.\./
  syn cluster jsClTop add=jsListAssignRegion
  hi! link jsSplat jsVar

" }}}

" {{{ expressions

  syn region jsString start=/"/ end=/"/ skip=/\\./ keepend extend contains=@jsClInsideString nextgroup=@jsClAfterValue skipwhite skipnl
  syn region jsString start=/'/ end=/'/ skip=/\\./ keepend extend contains=@jsClInsideString nextgroup=@jsClAfterValue skipwhite skipnl
  syn cluster jsClExpr add=jsString
  syn cluster jsClTop add=jsString
  hi! link jsString String

  " new `` interpolated strings
  syn region jsSuperString start=/`/ end=/`/ skip=/\\./ contains=jsSuperStringExpr keepend extend
  hi! link jsSuperString jsString
  syn cluster jsClExpr add=jsSuperString
  syn cluster jsClTop add=jsSuperString
  syn region jsSuperStringExpr matchgroup=jsSuperStringDelim start=/\${/ end=/}/ keepend extend
        \ contains=@jsClExpr,jsErrorCloseSquare,jsErrorCloseParen,jsErrorSemicolon
  hi! link jsSuperStringDelim Special

  syn match jsIdentifier /\%(\<[A-Za-z_]\|\$\)[$A-Za-z0-9_]*\%(\$\|\>\)/ nextgroup=@jsClAfterValue,jsAssign skipwhite skipnl contains=jsUserIdentifier
  syn cluster jsClExpr add=jsIdentifier
  syn cluster jsClTop add=jsIdentifier

  " special identifiers
  syn keyword jsSpecialIdentifier super this nextgroup=@jsClAfterValue,jsAssign skipwhite skipnl
  hi! link jsSpecialIdentifier SpecialChar
  syn cluster jsClExpr add=jsSpecialIdentifier
  syn cluster jsClTop add=jsSpecialIdentifier

  syn region jsCall contained matchgroup=jsParens start=/(/ end=/)/ keepend extend
        \ contains=@jsClExpr,jsErrorCloseBrace,jsErrorCloseSquare,jsErrorSemicolon,jsComment
        \ nextgroup=@jsClAfterValue skipwhite skipnl
  syn region jsPropAccess contained matchgroup=jsParens start=/\[/ end=/\]/ keepend extend
        \ contains=@jsClExpr,jsErrorCloseBrace,jsErrorCloseParen,jsErrorSemicolon,jsComment
        \ nextgroup=@jsClAfterValue,jsAssign skipwhite skipnl
  hi! link jsParens Special
  syn cluster jsClAfterValue add=jsCall
  syn cluster jsClAfterValue add=jsCall,jsPropAccess

  " parenthesized regions
  syn region jsParenExpr matchgroup=jsParens start=/(/ end=/)/ keepend extend contains=@jsClExpr
        \ nextgroup=@jsClAfterValue skipwhite skipnl
        \ matchgroup=Error end=/[;]/
  syn cluster jsClExpr add=jsParenExpr
  syn cluster jsClTop add=jsParenExpr

" }}}

" {{{ regex expressions

  syn region jsRegexRegion matchgroup=jsRegexDelim start="/[/*]\@!" end="/" skip="\\." contained keepend extend
        \ nextgroup=@jsClAfterValue skipwhite skipnl
  syn cluster jsClExpr add=jsRegexRegion

  syn match jsRegexEscape /\\./ contained containedin=jsRegexRegion
  syn match jsRegexSequence /\\[wd]/ contained containedin=jsRegexRegion
  syn match jsRegexQuantifier /[+*?]\|{\d\+\%(,\d\+\)\=}/ contained containedin=jsRegexRegion
  syn match jsRegexSpecial /[.^$]/ contained containedin=jsRegexRegion

  hi! link jsRegexDelim Statement
  hi! link jsRegexQuantifier Typedef
  hi! link jsRegexSpecial Typedef
  hi! link jsRegexEscape Comment
  hi! link jsRegexSequence Identifier

" }}}

" {{{ operators

  syn match jsDot /\./ contained nextgroup=jsPropertyName,jsMethodName skipwhite skipnl
  hi! link jsDot Operator
  syn cluster jsClAfterValue add=jsDot

  syn match jsAssign /[-+/*&|^%]\?=[>=]\@!/ contained nextgroup=@jsClExpr skipwhite skipnl
  hi! link jsAssign Operator

  syn match jsCommaOperator /,/
  hi! link jsCommaOperator Operator

  syn match jsLogicalOperator /\%(&&\|||\|[*&^|]=\@!\|+[+=]\@!\|-[-=]\@!\|\/[*/]\@!\)/ contained
        \ nextgroup=@jsClExpr skipwhite skipnl
  syn match jsComparisonOperator /\%([!=]==\=\|[<>]=\=\)/ contained
        \ nextgroup=@jsClExpr skipwhite skipnl
  syn keyword jsComparisonOperator contained instanceof nextgroup=@jsClExpr skipwhite skipnl
  syn cluster jsClAfterValue add=jsLogicalOperator,jsComparisonOperator
  hi! link jsLogicalOperator Operator
  hi! link jsComparisonOperator Keyword

" }}}

" {{{ property names / method calls

  " property names
  syn match jsPropertyName /\h\w*/ contained nextgroup=@jsClAfterValue,jsAssign skipwhite skipnl

  " method calls
  syn match jsMethodName /\h\w*\ze\_s*(/ contained nextgroup=jsCall skipwhite skipnl

" }}}

" {{{ statements

  hi! link jsVar Macro

  syn region jsVarDecl matchgroup=jsVar start=/\<\%(var\|let\|const\)\>/ end=/;/
        \ keepend extend contains=@jsClExpr,jsVarComma,jsDictAssign,jsListAssignRegion,tsTypeFollowedByValue
  syn match jsVarComma /,/ contained
  hi! link jsVarComma jsVar

  syn region jsReturnStatement matchgroup=jsStatement start=/\<\%(return\|throw\)\>/ end=/;/ end=/\ze}/
        \ keepend extend contains=@jsClExpr,jsErrorCloseParen,jsErrorCloseSquare
  hi! link jsStatement Statement

  syn region jsBreakStatement matchgroup=jsStatement start=/\<break\|continue\>/ end=/;/
        \ keepend extend
  hi! link jsBreakStatement Keyword

  syn cluster jsClTop add=jsVarDecl,jsReturnStatement,jsBreakStatement

" }}}

" {{{ for loops and conditionals

  syn match jsOrphanFlowControl /\<\%(if\|for\|while\|do\)\>/
  syn cluster jsClTop add=jsOrphanFlowControl
  hi! link jsOrphanFlowControl jsSyntaxError

  " simple braces for 'else' and 'for' blocks
  syn region jsFlowBraces matchgroup=jsConditional start=/{/ end=/}/ keepend extend contained contains=@jsClTop,@jsClImportExport
  " braces for 'if' clauses that will allow an 'else' afterward
  syn region jsConditionalBraces matchgroup=jsConditional start=/{/ end=/}/ keepend extend contained contains=@jsClTop,@jsClImportExport
        \ nextgroup=jsConditionalElse skipwhite skipnl
  " braces for a 'do' clause that will allow a 'while' afterward
  syn region jsDoWhileBraces matchgroup=jsConditional start=/{/ end=/}/ keepend extend contained contains=@jsClTop,@jsClImportExport
        \ nextgroup=jsDoWhile skipwhite skipnl

  " if ()
  syn region jsConditionalRegion matchgroup=jsConditional start=/\<if\_s*(/ end=/)/
        \ keepend extend contains=@jsClExpr,jsErrorSemicolon,jsErrorCloseBrace,jsErrorCloseSquare
        \ nextgroup=jsConditionalBraces skipwhite skipnl
  " else
  syn keyword jsConditionalElse contained else nextgroup=jsFlowBraces skipwhite skipnl
  hi! link jsConditionalElse jsConditional

  " while ()
  syn region jsFlowRegion matchgroup=jsConditional start=/\<while\_s*(/ end=/)/
        \ keepend extend contains=@jsClExpr,jsErrorSemicolon,jsErrorCloseBrace,jsErrorCloseSquare
        \ nextgroup=jsFlowBraces skipwhite skipnl
  " while () after a do {} clause
  syn region jsDoWhile matchgroup=jsConditional start=/\<while\_s*(/ end=/);/ contained
        \ keepend extend contains=@jsClExpr,jsErrorSemicolon,jsErrorCloseBrace,jsErrorCloseSquare
        \ nextgroup=jsFlowBraces skipwhite skipnl
  " do {} clause
  syn keyword jsDo do nextgroup=jsDoWhileBraces skipwhite skipnl
  hi! link jsDo jsConditional

  " for ()
  syn region jsFlowRegion matchgroup=jsConditional start=/\<for\_s*(/ end=/)/
        \ keepend extend contains=@jsClExpr,jsForSemicolon,jsForIn,jsForOf,jsForVar,jsErrorCloseBrace,jsErrorCloseSquare
        \ nextgroup=jsFlowBraces skipwhite skipnl
  syn match jsForSemicolon contained /;/
  hi! link jsForSemicolon jsConditional
  syn keyword jsForVar contained var let const
  hi! link jsForVar jsVar
  syn keyword jsForIn contained in
  hi! link jsForIn jsDict
  syn keyword jsForOf contained of
  hi! link jsForOf jsList

  hi! link jsFlowSimple jsConditional
  hi! link jsConditional Function


  syn region jsFlowPost matchgroup=jsConditional start=/\<while\_s*(/ end=/);/ keepend extend contained
  hi! link jsFlowPost jsConditional

  " switch() (case / default)

  syn region jsSwitchIntroRegion matchgroup=jsConditional start=/\<switch\_s*(/ end=/)/
        \ keepend extend contains=@jsClExpr,jsErrorCloseBrace,jsErrorCloseSquare
        \ nextgroup=jsSwitchBodyRegion skipwhite skipnl
  syn region jsSwitchBodyRegion contained matchgroup=jsConditional start=/{/ end=/}/ keepend extend
        \ contains=@jsClTop,jsCaseStatement,jsDefaultStatement
  syn region jsCaseStatement contained matchgroup=jsDefaultStatement start=/\<case\>/ end=/:/
        \ contains=@jsClExpr,jsErrorCloseBrace,jsErrorCloseSquare,jsErrorComma,jsErrorAssign,jsErrorCloseParen
  syn match jsDefaultStatement contained /\<default:/

  hi! link jsDefaultStatement Statement


  syn cluster jsClTop add=jsConditionalRegion,jsFlowRegion,jsDo,jsSwitchIntroRegion

" }}}

" {{{ try/catch/finally

  hi! link jsTry Statement

  syn region jsTryBlock matchgroup=jsTry start=/\<try\_s*{/ end=/}/ keepend extend
        \ contains=@jsClTop,@jsClImportExport
        \ nextgroup=jsCatchStatement,jsFinallyStatement skipwhite skipnl

  syn region jsCatchStatement contained matchgroup=jsTry start=/\<catch\_s*(/ end=/)/ keepend extend
        \ contains=jsErrorCloseBrace,jsErrorSemicolon,jsErrorComma,jsErrorAssign
        \ nextgroup=jsCatchBlock skipwhite skipnl

  syn keyword jsFinallyStatement contained finally nextgroup=jsFinallyBlock skipwhite skipnl
  hi! link jsFinallyStatement jsTry

  syn region jsCatchBlock contained matchgroup=jsTry start=/{/ end=/}/ keepend extend
        \ contains=@jsClTop,@jsClImportExport
        \ nextgroup=jsFinallyStatement skipwhite skipnl
  syn region jsFinallyBlock contained matchgroup=jsTry start=/{/ end=/}/ keepend extend
        \ contains=@jsClTop,@jsClImportExport

  syn cluster jsClTop add=jsTryBlock

" }}}

" {{{ imports/exports

  syn cluster jsClImportExport add=jsImportRegion,jsExportRegion

  hi! link jsImport Macro
  hi! link jsImportString Comment


  syn region jsImportRegion matchgroup=jsImport start=/\<import\>/ end=/;/
      \ contains=jsImportMembers,jsImportString,jsUserIdentifier,jsImportStar,jsImportFromAs,jsImportComma

  syn keyword jsImportFromAs contained from as
  hi! link jsImportFromAs jsImport

  syn match jsImportStar contained /\*/
  hi! link jsImportStar jsImportString

  syn region jsImportString contained start=/\z(["']\)/ end=/\z1/ keepend extend

  syn region jsImportMembers contained matchgroup=jsImport start=/{/ end=/}/ keepend extend
        \ contains=jsImportIdentifier,jsUserIdentifier,jsImportComma,jsImportFromAs
  syn match jsImportComma contained /,/
  hi! link jsImportComma jsImport

  syn match jsImportIdentifier contained /[$A-Za-z_][$A-Za-z_0-9]*/
  hi! link jsImportIdentifier jsImportString

  " EXPORTS

  hi! link jsExport SpecialChar
  hi! link jsExportDefault Statement
  hi! link jsExportStar Statement

  syn keyword jsExportStart export skipwhite skipnl
        \ nextgroup=jsExportDefault,jsExportStar,jsExportList,jsExportLetRegion,jsFullFunc,tsAbstractClass
  hi! link jsExportStart jsExport
  "syn region jsExportRegion matchgroup=jsImport start=/\<export\>/ end=/;/ keepend extend
        "\ contains=jsExportList

  " export { name1, name2, …, nameN };
  " export { variable1 as name1, variable2 as name2, …, nameN };
  syn region jsExportList matchgroup=jsExportParens start=/{/ end=/};/ end=/}\ze\_s*from\>/
        \ contained keepend extend
        \ contains=jsImportIdentifier,jsUserIdentifier,jsImportComma,jsExportAs,jsExportAsDefault
        \ nextgroup=jsExportFromRegion skipwhite skipnl
  hi! link jsExportParens jsExport
  syn keyword jsExportAs contained as nextgroup=jsExportAsDefault skipwhite skipnl
  hi! link jsExportAs jsExport
  syn keyword jsExportAsDefault contained default
  hi! link jsExportAsDefault jsExportDefault

  syn region jsExportLetRegion contained matchgroup=jsVar start=/\<\%(var\|let\|const\)\>/ matchgroup=jsExport end=/;/
        \ keepend extend contains=@jsClExpr,jsVarComma

  syn keyword jsExportDefault contained default
        \ nextgroup=jsFullFunc,jsClassIntro skipwhite skipnl

  syn match jsExportStar /\*/ contained nextgroup=jsExportFromRegion skipwhite skipnl

  syn region jsExportFromRegion contained matchgroup=jsExportFrom start=/\<from\>/ end=/;/
        \ contains=jsImportString
  hi! link jsExportFrom jsExport

  " export let name1, name2, …, nameN; // also var, const
  " export let name1 = …, name2 = …, …, nameN; // also var, const
  " export function FunctionName(){...}
  " export class ClassName {...}

  " export default expression;
  " export default function (…) { … } // also class, function*
  " export default function name1(…) { … } // also class, function*
  " export { name1 as default, … };

  " export * from …;
  " export { name1, name2, …, nameN } from …;
  " export { import1 as name1, import2 as name2, …, nameN } from …;
  " export { default } from …;


  " import ImportClause 'from' <string>
  " import <string>

  " ImportClause:
  "     <identifier>
  "     [ <identifier> , ] '*' 'as' <identifier>
  "     [ <identifier> , ] NamedImports
  " NamedImports:
  "     '{\s*}'
  "     '{' ImportsList '}'
  "     '{' ImportsList ',' '}'
  " ImportsList:
  "     ImportSpecifier
  "     ImportsList , ImportSpecifier
  "     See 15.2.2
  " ImportSpecifier:
  "     <identifier>
  "     <identifier> 'as' <identifier>

  syn cluster jsClTop add=jsClImportExport

" }}}

" {{{ classes

  syn match jsClassIntro /\<class\_s\+\w\+\>/ nextgroup=jsClassBody,jsClassExtendsRegion,tsClassImplementsRegion,tsTypeArgsRegion skipwhite skipnl
        \ contains=jsClass,jsUserIdentifier
  syn keyword jsClass contained class
  hi! link jsClass Typedef
  syn cluster jsClExpr add=jsClassIntro

  syn keyword tsAbstractClass contained abstract nextgroup=jsClassIntro skipwhite skipnl
  hi! link tsAbstractClass jsClass
  syn cluster jsClTop add=tsAbstractClass

  syn region jsClassExtendsRegion matchgroup=jsClass start=/\<extends\>/
        \ end="\ze{" end="\ze\<implements\>"
        \ contained keepend extend
        \ nextgroup=jsClassBody,tsClassImplementsRegion skipwhite skipnl
        \ contains=@jsClExtendable

  if b:javascript_typescript
    syn region tsClassImplementsRegion matchgroup=jsClass start=/\<implements\>/ end=/\ze{/
          \ contained keepend extend
          \ contains=@jsClExtendable
          \ nextgroup=jsClassBody skipwhite skipnl
  endif

  syn region jsClassBody matchgroup=jsClass start=/{/ end=/}/ contained
        \ contains=jsClassConstructor,jsClassMethod,jsMethodGenerator,jsClassStatic,jsComment,@jsClInsideClass

  if b:javascript_es6
    syn match jsMethodGenerator contained /\*\ze\_s*[$A-Za-z_]/
    hi! link jsMethodGenerator Statement
  endif
  syn match jsClassMethod /[$A-Za-z_][$A-Za-z_0-9]*\ze\_s*(/ contained
        \ nextgroup=jsFullFuncArgs skipwhite skipnl
  syn keyword jsClassConstructor contained constructor nextgroup=tsConstructorArgsRegion skipwhite skipnl
  hi! link jsClassConstructor jsClass

  syn keyword jsClassStatic contained static nextgroup=jsClassProperty skipwhite skipnl
  syn region jsClassProperty contained start=/\<[$A-Za-z_][$A-Za-z0-9_]*\ze\_s*[:=]/ keepend extend matchgroup=jsClass end=/;/
        \ contains=jsAssign,tsClassMemberTypeRegion
  hi! link jsClassStatic jsClass

  syn cluster jsClInsideClass add=jsClassProperty

  syn cluster jsClTop add=jsClassIntro


" }}}

" {{{ function declarations (top-level and lambdas)

  hi! link jsFullFunc Macro
  hi! link jsAnonFunc Include

  syn match jsFullFunc /\<function\ze\_s\+[$A-Za-z0-9_]/ nextgroup=jsFullFuncName skipwhite skipnl
  syn match jsAnonFunc /\<function\ze\_s*(/ contained nextgroup=jsAnonFuncArgs,jsAnonFuncName skipwhite skipnl
  syn cluster jsClExpr add=jsAnonFunc

  syn match jsFullFuncName contained /\<[$A-Za-z_][$A-Za-z0-9_]*\>/ contains=jsUserIdentifier
        \ nextgroup=jsFullFuncArgs skipwhite skipnl
  syn match jsAnonFuncName contained /\<[$A-Za-z_][$A-Za-z0-9_]*\>/ contains=jsUserIdentifier
        \ nextgroup=jsAnonFuncArgs skipwhite skipnl

  " full/anonymous function arg list
  syn region jsFullFuncArgs contained matchgroup=jsFullFunc start=/(/ end=/)/ contained
        \ keepend extend contains=jsFullFuncCommaError,tsTypeFollowedByArg,jsFuncArgComma,@jsClExpr,jsComment
        \ nextgroup=jsFullFuncBody,tsTypeFollowedByFullFuncBody skipwhite skipnl
  syn match jsFuncArgComma contained /,/
  hi! link jsFuncArgComma jsFullFunc
  if ! b:javascript_typescript
    syn match jsFullFuncCommaError /,\ze\_s*)/
    hi! link jsFullFuncCommaError Error
  endif
  syn region jsAnonFuncArgs contained matchgroup=jsAnonFunc start=/(/ end=/)/ contained
        \ keepend extend contains=jsAnonFuncArgComma
        \ nextgroup=jsAnonFuncBody skipwhite skipnl
        \ matchgroup=Error end=/,\_s*)/

  " both types of function braces
  syn region jsFullFuncBody matchgroup=jsFullFuncBrace start=/{/ end=/}/ keepend extend contained
        \ contains=@jsClTop,@jsClImportExport
  hi! link jsFullFuncBrace jsFullFunc
  syn region jsAnonFuncBody matchgroup=jsAnonFuncBrace start=/{/ end=/}/ keepend extend contained contains=@jsClTop,@jsClImportExport
  syn region jsAnonFuncBody matchgroup=jsAnonFuncBrace start=/(/ end=/)/ keepend extend contained contains=@jsClExpr,jsErrorCloseBrace,jsErrorCloseSquare,jsErrorSemicolon
  hi! link jsAnonFuncBrace jsAnonFunc

  syn match jsAnonFuncArgComma /,/ contained
  hi! link jsAnonFuncArgComma jsAnonFunc

  syn match jsFuncFatArrow /\%(\<[$A-Za-z_][$A-Za-z_0-9]*\|(\%([$A-Za-z_][$A-Za-z_0-9]*\|\[\w\+\_s*\%(,\_s*\w\+\_s*\)*\]\)\_s*\%(,\_s*[$A-Za-z_][$A-Za-z_0-9]*\)*)\|()\)\_s*=>/ contains=jsAnonFuncArgComma extend
        \ nextgroup=jsAnonFuncBody skipwhite skipnl
  syn cluster jsClExpr add=jsFuncFatArrow
  hi! link jsFuncFatArrow jsAnonFunc

  " this version is triggered by the 'async' keyword so we can use a much
  " simpler start/end pattern
  syn region jsFuncFatArrowAfterAsync contained matchgroup=jsFuncFatArrow start=/(/ end=/)/ keepend extend
        \ contains=jsFullFuncCommaError,tsTypeFollowedByArg,jsFuncArgComma,@jsClExpr,jsComment
        \ matchgroup=jsSyntaxError end=/[\]}]/
        \ nextgroup=jsFuncFatArrowLonely,tsFuncFatArrowRetTypeRegion skipwhite skipnl

  syn region tsFuncFatArrowRegion matchgroup=jsFuncFatArrow start=/(\ze\%()\|[$A-Za-z_][$A-Za-z_0-9]*\|{[$A-Za-z_][$A-Za-z_0-9]*\%(\_s*,\_s*[$A-Za-z_][$A-Za-z_0-9]*\)*}\):/ end=/)/
        \ matchgroup=jsSyntaxError end=/[\]};]/
        \ contains=jsFullFuncCommaError,tsTypeFollowedByArg,jsFuncArgComma,@jsClExpr,jsComment
        \ keepend extend
        \ nextgroup=jsFuncFatArrowLonely,tsFuncFatArrowRetTypeRegion skipwhite skipnl
  syn match tsFuncFatArrowSimple /(\%([$A-Za-z_][$A-Za-z_0-9]*\)\=)\ze:/ keepend extend
        \ contains=jsIdentifier
        \ nextgroup=jsFuncFatArrowLonely,tsFuncFatArrowRetTypeRegion skipwhite skipnl
  hi! link tsFuncFatArrowSimple jsFuncFatArrow
  syn cluster jsClExpr add=tsFuncFatArrowRegion,tsFuncFatArrowSimple
  syn region tsFuncFatArrowRetTypeRegion matchgroup=jsFuncFatArrowLonely start=/:/ end=/=>/ keepend extend
        \ matchgroup=jsSyntaxError end=/[[\]});,]/
        \ contains=@tsClTypeHere
        \ nextgroup=jsAnonFuncBody,@jsClExpr skipwhite skipnl

  syn match jsFuncFatArrowLonely contained /=>/ nextgroup=jsAnonFuncBody,@jsClExpr skipwhite skipnl
      \ keepend extend
  hi! link jsFuncFatArrowLonely jsAnonFunc

  syn cluster jsClAfterValue add=jsFuncFatArrowLonely

  "syn match jsAnonFunc

  syn cluster jsClTop add=jsFullFunc,jsAnonFunc,jsFuncFatArrow,jsFuncFatArrowLonely

" }}}

" async/await {{{

  if b:javascript_es2017
    " async functions
    syn keyword jsAsync async nextgroup=jsFuncFatArrowAfterAsync,jsFullFunc,jsAnonFunc skipwhite skipnl
    syn cluster jsClExpr add=jsAsync
    hi! link jsAsync Statement

    " await expressions
    syn keyword jsAwait await nextgroup=@jsClExpr skipwhite skipnl contained
    syn cluster jsClExpr add=jsAwait
    hi! link jsAwait jsAsync

    syn cluster jsClTop add=jsAwait,jsAsync
  endif

" }}}

" nesting/embedding {{{

  " if we're embedded in a PHP script, also match PHP regions in some places
  if get(g:, 'main_syntax', '') == 'php'
    " NOTE: normally you'd syntax-include the syntax you're nesting, but that
    " would cause infinite recursion here
    syn cluster jsClExpr add=phpRegion
    syn cluster jsClInsideString add=phpRegion
  endif

" }}}

if b:javascript_typescript " {{{

  " simple types {{{

    syn keyword tsSimpleType contained string number boolean true false null undefined this
    syn keyword tsSimpleTypeSpecial contained any never void
    syn keyword tsSimpleTypeBad contained Number String Boolean
    syn region tsSimpleTypeString contained start=/\z(['"]\)/ end=/\z1/ skip=/\\./
    hi! link tsSimpleType Function
    hi! link tsSimpleTypeSpecial Identifier
    hi! link tsSimpleTypeBad IncSearch
    hi! link tsSimpleTypeString Comment

    syn cluster tsClSimpleTypes add=tsSimpleType,tsSimpleTypeSpecial,tsSimpleTypeBad,tsSimpleTypeOther,tsSimpleTypeString

  " }}}

  " simple type declarations using "type" statement {{{

    syn region tsTypeDecl matchgroup=tsInterface start=/\<type\>/ end=/\ze=/ keepend extend
          \ contains=tsTypeNameHere
          \ nextgroup=tsTypeDeclTypeRegion
    syn region tsTypeDeclTypeRegion contained matchgroup=tsInterface start=/=/ end=/;/ keepend extend
          \ matchgroup=jsSyntaxError end=/[:,]/
          \ contains=@tsClTypeHere

    syn cluster jsClTop add=tsTypeDecl

  " }}}

  " typescript interfaces - things which are members of things and have which are properties of things {{{

    syn match tsTypeNameHere contained /\c[$a-z_][$a-z0-9_]*/
          \ contains=jsUserIdentifier
          \ nextgroup=tsTypeNameDot,tsTypeArgsRegion,tsTypeNameExtends,tsTypeIsList skipwhite
    syn match tsTypeNameDot contained /\./
          \ nextgroup=tsTypeNameProperty skipwhite
    syn match tsTypeNameProperty contained /\c[$a-z_][$a-z0-9_]*/
          \ nextgroup=tsTypeNameDot,tsTypeArgsRegion skipwhite
    syn match tsTypeIsList contained /\[\]/ keepend extend
    syn keyword tsTypeNameExtends contained extends implements
    hi! link tsTypeNameExtends tsInterface
    hi! link tsTypeIsList tsTypeNameExtends

    hi! link tsTypeNameDot jsDot

    syn cluster jsClExtendable add=tsTypeNameHere
    syn cluster tsClTypeHere add=tsTypeNameHere

    syn region tsTypeArgsRegion contained matchgroup=tsTypeArgsDelim start=/</ end=/>/ keepend extend
          \ contains=tsTypeArgsComma,@tsClTypeHere
          \ nextgroup=jsClassExtendsRegion skipwhite skipnl
    syn match tsTypeArgsComma contained /,/

    syn region tsInterfaceArgsRegion contained matchgroup=tsTypeArgsDelim start=/</ end=/>/ keepend extend
          \ contains=tsTypeArgsComma,@tsClTypeHere
          \ nextgroup=tsInterfaceBody,tsInterfaceExtendsRegion skipwhite skipnl

    hi! link tsTypeArgsDelim tsInterface
    hi! link tsTypeArgsComma tsTypeArgsDelim

    syn keyword tsTypeComplex contained Array ReadonlyArray
    hi! link tsTypeComplex tsSimpleType

    syn match tsTypeUnion contained /|/
    hi! link tsTypeUnion Macro
    syn cluster tsClTypeHere add=tsTypeUnion

  " }}}

  " ": <type>" syntax {{{

    syn region tsTypeFollowedByValue matchgroup=tsTypeColon start=/:/ matchgroup=jsAssign end=/=/
          \ keepend extend
          \ nextgroup=@jsClExpr skipwhite skipnl
          \ contains=@tsClTypeHere
          \ end=/\ze;/  " use a zero-length match for ';' so that the nextgroup=@jsClExpr can't match after ';'

    syn region tsTypeFollowedByFullFuncBody matchgroup=tsTypeColon start=/:/ end=/\ze{\%($\|\s\)/ end=/\ze;/
          \ keepend extend
          \ nextgroup=jsFullFuncBody,tsNoFuncBody skipwhite skipnl
          \ contains=@tsClTypeHere

    syn match tsNoFuncBody contained /;/
    hi! link tsNoFuncBody jsFullFunc

    syn region tsTypeFollowedByArg matchgroup=tsTypeColon start=/:/ keepend extend
          \ matchgroup=jsFuncArgComma end=/,/ end=/\ze)/
          \ matchgroup=jsAssign end=/=>\@!/
          \ contains=@tsClTypeHere

    hi! link tsTypeColon Function

  " }}}

  " function prototypes {{{

    hi! link tsFuncPrototype String

    " there are two variants of this - (A) uses fat-arrow and can be used anywhere a type
    " definition is expected. (B) uses ":" instead of fat-arrow and is used in interface
    " declarations
    syn region tsFuncPrototypeRegionA contained matchgroup=tsFuncPrototype start=/(/ end=/)/ keepend extend
          \ contains=tsFuncPrototypeArgType,jsComment
          \ nextgroup=tsFuncPrototypeFatArrow skipwhite skipnl
    syn region tsFuncPrototypeRegionB contained matchgroup=tsFuncPrototype start=/(/ end=/)/ keepend extend
          \ contains=tsFuncPrototypeArgType
          \ nextgroup=tsFuncPrototypeColon skipwhite
    syn match tsFuncPrototypeFatArrow contained /=>/ nextgroup=@tsClTypeHere skipwhite skipnl extend
    syn region tsFuncPrototypeColon contained matchgroup=tsFuncPrototypeFatArrow start=/:/ end=/;/ contains=@tsClTypeHere
    hi! link tsFuncPrototypeFatArrow tsFuncPrototype

    syn region tsFuncPrototypeArgType contained matchgroup=tsFuncPrototype start=/:/ end=/,\|\ze)/ keepend extend
          \ contains=@tsClTypeHere

    syn cluster tsClTypeHere add=tsFuncPrototypeRegionA

  " }}}

  " type declarations {{{

    " interfaces {{{

      hi! link tsInterface Function
      hi! link tsMemberModifier jsDict

      syn cluster jsClTop add=tsInterface
      syn keyword tsInterface interface nextgroup=tsInterfaceName skipwhite skipnl

      syn match tsInterfaceName contained /[$A-Za-z0-9_]\+/ contains=jsUserIdentifier
            \ nextgroup=tsInterfaceArgsRegion,tsInterfaceBody,tsInterfaceExtendsRegion skipwhite skipnl

      syn region tsInterfaceExtendsRegion matchgroup=tsInterface start=/\<extends\>/
            \ end="\ze{"
            \ contained keepend extend
            \ nextgroup=tsInterfaceBody,tsInterfaceArgsRegion skipwhite skipnl
            \ contains=@jsClExtendable

      syn region tsInterfaceBody contained matchgroup=tsInterface start=/{/ end=/}/ keepend extend
            \ contains=tsMemberReadonly,tsMemberName,jsComment,tsMemberWildcardRegion,tsCallSignatureRegion,tsFuncPrototypeRegionB

      " you can also create an anonymous interface type using a '{ ... }' region anywhere a type is expected
      syn cluster tsClTypeHere add=tsInterfaceBody

      syn keyword tsMemberReadonly contained readonly new
      hi! link tsMemberReadonly tsMemberModifier

      syn match tsMemberName contained /[$A-Za-z0-9_]\+?\=\ze:/
            \ nextgroup=tsIfaceMemberTypeRegion contains=tsMemberOptional
      hi! link tsMemberName jsUserIdentifier

      syn match tsMemberOptional contained /?/
      hi! link tsMemberOptional tsMemberModifier

      syn region tsClassMemberTypeRegion contained matchgroup=tsInterface start=/?:/ start=/:/ end=/\ze[=;]/
            \ matchgroup=jsSyntaxError end=/,/
            \ keepend extend
            \ contains=@tsClTypeHere

      syn region tsIfaceMemberTypeRegion contained matchgroup=tsInterface start=/?:/ start=/:/ end=/;/ end=/\ze}/
            \ matchgroup=jsSyntaxError end=/,/
            \ keepend extend
            \ contains=@tsClTypeHere

      syn region tsMemberWildcardRegion contained matchgroup=tsMemberModifier start=/\[\s*\w\+:/ end=/\]\ze:/
            \ contains=@tsClTypeHere nextgroup=tsIfaceMemberTypeRegion

    " }}}

    " "declare global" / "declare module" {{{

      hi! link tsDeclare SpecialChar

      syn keyword tsDeclare declare nextgroup=tsDeclareGlobalRegion,tsDeclareModuleIntro skipwhite skipnl
      syn region tsDeclareGlobalRegion matchgroup=tsDeclare start=/\<global\_s*{/ end=/}/ keepend extend
            \ matchgroup=Error end="[\])]"
            \ contains=@jsClTop

      syn region tsDeclareModuleIntro contained matchgroup=tsDeclare start=/\<module\>/ end=/\ze{/
            \ contains=jsString
            \ nextgroup=tsDeclareModuleRegion

      syn region tsDeclareModuleRegion contained matchgroup=tsDeclare start=/{/ end=/}/
            \ contains=@jsClTop

      syn cluster jsClTop add=tsDeclare

    " }}}

  " }}}

  " class members {{{

    syn keyword tsClassMemberModifier contained abstract private protected public
          \ nextgroup=jsClassProperty,jsAsync skipwhite skipnl
    hi! link tsClassMemberModifier jsClass
    syn cluster jsClInsideClass add=tsClassMemberModifier

  " }}}

  " private/public constructor args {{{

    syn region tsConstructorArgsRegion contained matchgroup=jsClassConstructor start=/(/ end=/)/ keepend extend
          \ matchgroup=Error end="[\]}]"
          \ contains=tsTypeFollowedByArg,tsTypeFollowedByArg,jsFuncArgComma,@jsClExpr,tsConstructorVisibility
          \ nextgroup=jsFullFuncBody skipwhite skipnl

    syn keyword tsConstructorVisibility contained private protected public
    hi! link tsConstructorVisibility tsClassMemberModifier

  " }}}

endif " }}}

if b:javascript_jsx " {{{

  " {{{ clusters

    " @jsxClAttr - attributes, properties, splat, and comments
    syn cluster jsxClAttr add=jsComment
    " @jsxClAttrExpr - anything that can follow `attr=` in a JSX tag
    " @jsxClInlineExpr - any special {...} stuff that goes inside html tags

  " }}}

  " {{{ highlight links

    " '<' and '>'
    hi! link jsxLTGT Keyword
    " self-closing '/' in '/>'
    hi! link jsxTagSelfClose SpecialChar

    " '&quot;' and other char sequences
    hi! link jsxHtmlEscape Function

    " body, div, and other standard tag names
    hi! link jsxKnownTag Keyword
    " other tag names
    hi! link jsxTagName Normal

    " attributes, and the '=' operator around them
    hi! link jsxAttrEquals String
    hi! link jsxAttrName Special
    hi! link jsxPropName String

    " the braces around jsx expressions
    hi! link jsxExprBraces Statement

    " the splat {...var} splat operator
    hi! link jsxAttrSplat Statement

    " string attribute values, and escaped characters inside
    hi! link jsxString Function
    hi! link jsxStringSpecial Typedef

    " unknown syntax
    hi! link jsxUnknownSyntax IncSearch




  " }}}

  " {{{ warnings - lowest precedence

    " cry about anything weird contained inside the tag
    syn match jsxTagUnknown contained /[^ \t\r\na-zA-Z0-9_/>-]\S*/
    hi! link jsxTagUnknown jsxUnknownSyntax

    syn match jsxOrphanLT contained $<\%(/\|\w\)\@!$
    syn cluster jsxClInlineExpr add=jsxOrphanLT
    hi! link jsxOrphanLT Error

    " lone ampersands
    syn match jsxOrphanSymbol contained /&/
    syn cluster jsxClInlineExpr add=jsxOrphanSymbol
    hi! link jsxOrphanSymbol Error

    " cry about orphaned jsx closing tags
    syn match jsxOrphanCloseTag !</\w*! contained
    hi! link jsxOrphanCloseTag Error
    syn cluster jsClExpr add=jsxOrphanCloseTag

  " }}}

  " {{{ normal attributes and splats (near the top for lower precedence)

    syn cluster jsxClAttr add=jsxPropName,jsxAttrName

    " properties (no value assigned)
    syn match jsxPropName /\h[a-zA-Z0-9_-]*\>/ contained

    syn match jsxAttrName /\h[a-zA-Z0-9_-]*\>=\@=/ contained
          \ nextgroup=jsxAttrEquals skipwhite skipnl
    syn match jsxAttrEquals /=/ contained
          \ nextgroup=@jsxClAttrExpr

    " splat operator
    syn region jsxAttrSplatRegion matchgroup=jsxAttrSplat start=/{\.\.\./ end=/}/ contains=@jsClExpr
          \ contained keepend extend
    syn cluster jsxClAttr add=jsxAttrSplatRegion


  " }}}

  " {{{ start/end tag

    " outer tag region which extends all the way to !/\zs>! or !</close\zs>! and contains:
    " attributes, opening tag name, tag self-close, jsx property splatting, and the 'inner tag'
    syn cluster jsClExpr add=jsxTagOuter
    syn cluster jsxClAttrExpr add=jsxTagOuter
    syn region jsxTagOuter matchgroup=jsxLTGT start=!<\z(\h\w*\%(\.\w\+\)*\)\@=! keepend extend
          \ matchgroup=jsxTagSelfClose end=!/\ze\z1>! end=!/>\@=!
          \ nextgroup=jsxTagGoodClosing
          \ contains=jsxTagInner,jsxTagOuterName,jsxTagUnexpectedCloseTag,jsxTagOpenError,jsxTagUnknown,@jsxClAttr
    syn match jsxTagGoodClosing contained !\w\+\%(\.\w\+\)*>! contains=jsxPossibleIdentifier
    syn match jsxTagGoodClosing contained !>!
    hi! link jsxTagGoodClosing jsxLTGT

    " inner tag region which goes from '>' all the way to '</'
    syn region jsxTagInner matchgroup=jsxLTGT start=!>! end=!<\%(/\h\w*\%(\.\w\+\)*\)\@=! keepend extend contained
          \ contains=jsxTagOuter,@jsxClInlineExpr

    syn match jsxTagOuterName /<\@<=\h\w*\%(\.\w\+\)*/ contained contains=jsxPossibleIdentifier
          \ nextgroup=tsTypeArgsRegion
    syn match jsxPossibleIdentifier contained /\<\h\w*\>/ nextgroup=jsxTagNameDot contains=jsxHtmlTagName,jsUserIdentifier
    syn match jsxTagNameDot contained /\./ nextgroup=jsxIdentifierProperty
    syn match jsxIdentifierProperty contained /\h\w*/ nextgroup=jsxTagNameDot
    hi! link jsxTagNameDot jsDot

    syn match jsxTagSelfClose !/! contained
    hi! link jsxTagSelfClose SpecialChar

    " highlight mismatched ending
    syn match jsxTagUnexpectedCloseTag contained !/\@<=\h\w*\%(\.\w\+\)*>! extend
    hi! link jsxTagUnexpectedCloseTag Error
    syn match jsxTagOpenError contained !<\w*!
    hi! link jsxTagOpenError Error

  " }}}

  " {{{ javascript expressions embedded in tag bodies

    syn region jsxSimpleExpr contained matchgroup=jsxExprBraces start=/{/ end=/}/ keepend extend contains=@jsClExpr,jsComment
    syn cluster jsxClInlineExpr add=jsxSimpleExpr

  " }}}

  " {{{

    syn match jsxHtmlEscape contained /&\w\+;/ extend
    syn cluster jsxClInlineExpr add=jsxHtmlEscape

  " }}}

  " {{{ expression values

    " brace-enclosed expressions {}
    syn region jsxAttrValueExpr matchgroup=jsxExprBraces start=/{/ end=/}/ keepend extend contained
          \ contains=@jsClExpr
    syn cluster jsxClAttrExpr add=jsxAttrValueExpr

    " strings
    syn region jsxString start=/"/ end=/"/ contained
    syn cluster jsxClAttrExpr add=jsxString
    hi! link jsxString Function

  " }}}

  " {{{

    " recognised tag names
    syn keyword jsxHtmlTagName contained html
    syn keyword jsxHtmlTagName contained base head style title
    syn keyword jsxHtmlTagName contained address article footer header h1 h2 h3 h4 h5 h6 hgroup nav section
    syn keyword jsxHtmlTagName contained dd div dl dt figcaption hr li main ol p pre ul
    syn keyword jsxHtmlTagName contained a abbr b bdi bdo br cite code data dfn em i kbd mark q rp rt rtc ruby s samp small span strong sub sup time u var wbr
    syn keyword jsxHtmlTagName contained area audio map track video
    syn keyword jsxHtmlTagName contained embed object param source
    syn keyword jsxHtmlTagName contained canvas noscript script
    syn keyword jsxHtmlTagName contained del ins
    syn keyword jsxHtmlTagName contained caption col colgroup table tbody td tfoot th thead tr
    syn keyword jsxHtmlTagName contained button datalist fieldset form input keygen label legend meter optgroup option output progress select
    syn keyword jsxHtmlTagName contained details dialog menu menuitem summary
    syn keyword jsxHtmlTagName contained img
    " NOTE: deprecated
    syn keyword jsxHtmlTagName contained acronym applet basefont big blink center dir frame frameset isindex listing noembed plaintext spacer strike tt xmp
    hi! link jsxHtmlTagName Keyword

  " }}}

endif " }}}

syn sync fromstart

let b:current_syntax = "javascript"

" vim: foldmethod=marker
