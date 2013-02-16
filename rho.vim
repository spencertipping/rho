" Rho VIM highlighter | Spencer Tipping
" Licensed under the terms of the MIT source code license

" Language: Rho
" Maintainer: Spencer Tipping <spencer@spencertipping.com>
" Website: http://github.com/spencertipping/rho

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = "rho"
endif

syn case match
set iskeyword=33,35-38,42-43,45,47-57,60-63,65-90,94-122,124,126

syn region  rhoString           matchgroup=rhoStringDelimiter start=/\z(["']\)/ end=/\z1/ skip=/\\./ keepend contains=rhoEscape
syn region  rhoEscape           matchgroup=rhoStringDelimiter start=/#{/ end=/}/ contains=TOP contained

syn keyword rhoKernel           require include inherit rebind
syn keyword rhoDynamicScope     return cc become! do
syn keyword rhoOOP              class subclass

syn keyword rhoModifier         when unless while until for and where rescue raise
syn cluster rhoActiveWords      add=rhoKernel,rhoDynamicScope,rhoModifier,rhoOOP

syn match   rhoMethod           /\.\w\+/ contains=@rhoActiveWords

syn region  rhoRegexpSyntax     matchgroup=rhoRegexpDelimiter start=/\/\S\@=/ end=/\/\w*/ skip=/\\./ contained
syn region  rhoRegexpGroup      matchgroup=rhoRegexpDelimiter start=/(/ end=/)/ skip=/\\./ contained
syn cluster rhoRegexpBody       add=rhoRegexpSyntax,rhoRegexpGroup

syn match   rhoRegexp           /\/\%([^\\\/]\|\\.\)*\// contains=@rhoRegexpBody

syn match   rhoDefined          /\/\//

syn match   rhoInstance         /@\+\k\+/

syn match   rhoFormal           /\k\+\s*/ contained
syn match   rhoFormalSeparator  /:/       contained
syn match   rhoBlockStart       /\(\<\k\+\|,\s*\k\+\|\s*=\s*\S\+\)\+:/ contains=rhoFormal,rhoFormalSeparator

syn match   rhoDefMethod        /\.\(un\)\?def\./ nextgroup=rhoLHS
syn match   rhoDefinition       /\<\(un\)\?def\./ nextgroup=rhoLHS
syn match   rhoAssignment       /\k\+\s*=\s\+/    contains=rhoLHS
syn match   rhoLHS              /\k\+/ contained

syn cluster rhoSpecialMethods   add=rhoDefinition,rhoAssignment
syn match   rhoImplicitMethod   /^\s*\k\+\(\.\s*\k\+\)*/ contains=@rhoActiveWords,@rhoSpecialMethods

syn match   rhoQuotedMethod     /\.&\k\+/

syn match   rhoLineComment      /\(\s\|^\)# .*/
syn region  rhoImplicitComment  start=/^\s*[A-Z]/ end=/[!?.:]\s*$/
syn match   rhoShebang          /\(\<\|^\)#!.*/

syn match   rhoSymbol           /:\k\+/
syn match   rhoFlag             /\<-\k\+/
syn match   rhoFlag             /^\s*-\k\+/

syn match   rhoFloat            /\<[-+]\?\d\+\(\.\d\+\)\?\([eE][-+]\d\+\)\?/
syn match   rhoFloat            /^\s*[-+]\?\d\+\(\.\d\+\)\?\([eE][-+]\d\+\)\?/
syn match   rhoHex              /\<0x[0-9a-fA-F]\+/
syn match   rhoHex              /^\s*0x[0-9a-fA-F]\+/
syn match   rhoOctal            /\<0[0-7]\+/
syn match   rhoOctal            /^\s*0[0-7]\+/

syn region  rhoQuotedParen      matchgroup=rhoDelimiter start=/%\w*(/  end=/)/
syn region  rhoQuotedBracket    matchgroup=rhoDelimiter start=/%\w*\[/ end=/]/
syn region  rhoQuotedBrace      matchgroup=rhoDelimiter start=/%\w*{/  end=/}/

hi def link rhoLineComment      Comment
hi def link rhoImplicitComment  Comment
hi def link rhoShebang          Special
hi def link rhoString           String
hi def link rhoStringDelimiter  Special
hi def link rhoFloat            Number
hi def link rhoHex              Number
hi def link rhoOctal            Number

hi def link rhoQuotedMethod     Keyword

hi def link rhoFormal           Identifier

hi def link rhoSymbol           String
hi def link rhoFlag             Special
hi def link rhoKernel           Special
hi def link rhoKernelInvocation Type

hi def link rhoDefinition       Special
hi def link rhoDefMethod        Special
hi def link rhoLHS              Identifier

hi def link rhoRegexp           String
hi def link rhoRegexpSyntax     String
hi def link rhoRegexpDelimiter  Special
hi def link rhoDefined          Operator

hi def link rhoDynamicScope     Keyword
hi def link rhoModifier         Keyword

hi def link rhoInstance         Type
hi def link rhoOOP              Type