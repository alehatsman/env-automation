if runo#should_abort('perl')
    finish
endif

" Regex
hi! link perlMatchStartEnd       RunoRed

" Builtin functions
hi! link perlOperator            RunoPink
hi! link perlStatementFiledesc   RunoPink
hi! link perlStatementFiles      RunoPink
hi! link perlStatementFlow       RunoPink
hi! link perlStatementHash       RunoPink
hi! link perlStatementIOfunc     RunoPink
hi! link perlStatementIPC        RunoPink
hi! link perlStatementList       RunoPink
hi! link perlStatementMisc       RunoPink
hi! link perlStatementNetwork    RunoPink
hi! link perlStatementNumeric    RunoPink
hi! link perlStatementProc       RunoPink
hi! link perlStatementPword      RunoPink
hi! link perlStatementRegexp     RunoPink
hi! link perlStatementScalar     RunoPink
hi! link perlStatementSocket     RunoPink
hi! link perlStatementTime       RunoPink
hi! link perlStatementVector     RunoPink

" Highlighting for quoting constructs, tied to existing option in vim-perl
if get(g:, 'perl_string_as_statement', 0)
  hi! link perlStringStartEnd RunoRed
endif

" Signatures
hi! link perlSignature           RunoOrangeItalic
hi! link perlSubPrototype        RunoOrangeItalic

" Hash keys
hi! link perlVarSimpleMemberName RunoPink
