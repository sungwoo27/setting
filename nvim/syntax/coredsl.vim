" Vim syntax file
" Language: CoreDSL
" Maintainer: Gemini
" Latest Revision: 2025-07-04

if exists("b:current_syntax")
  finish
endif

" Set case to be sensitive
syn case match

" Comments
syn region  coredslComment      start="//" end="$" oneline
" Strings
syn region  coredslString       start=/"/ skip=/\\"/ end=/"/
" Attributes
syn region  coredslAttribute    start="\[\[" end="\]\]"

" Keywords
syn keyword coredslKeyword      InstructionSet extends import architectural_state functions instructions behavior encoding assembly register extern const
syn keyword coredslType         unsigned signed int char void
syn keyword coredslStatement    if else

" Numbers
syn match   coredslNumber       "\<0x[0-9a-fA-F]\+"
syn match   coredslNumber       "\<\d\+"
syn match   coredslBinary       "\d\+'b[01]\+"

" Operators
" Operators
syn match   coredslOperator     "[-+*%&|^~=<>!]\{1,2}"
syn match   coredslOperator     "/\(/\)\@!"

" Highlight block labels like 'instructions', 'behavior', etc.
syn match coredslLabel "\<\(architectural_state\|functions\|instructions\|behavior\|encoding\|assembly\)\>"

" Highlight instruction names (Uppercase words at the beginning of a line inside an instructions block)
syn region coredslInstructionsBlock transparent start=/\<instructions\>\s*{/ end=/}/ contains=coredslInstructionDef,coredslComment,coredslString
syn match coredslInstructionDef "^\s*\zs\u\w*\ze" contained

" Highlighting links
hi def link coredslComment          Comment
hi def link coredslString           String
hi def link coredslAttribute        PreProc
hi def link coredslKeyword          Keyword
hi def link coredslType             Type
hi def link coredslStatement        Statement
hi def link coredslNumber           Number
hi def link coredslBinary           Constant
hi def link coredslOperator         Operator
hi def link coredslInstructionDef   Function
hi def link coredslLabel            Structure

let b:current_syntax = "coredsl"
