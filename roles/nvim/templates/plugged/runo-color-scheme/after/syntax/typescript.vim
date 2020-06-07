if runo#should_abort('typescript', 'typescriptreact')
    finish
endif

" Graphql

hi! link graphqlTemplateString            RunoFg
hi! link graphqlString                    Comment

hi! link typescriptAliasDeclaration       Identifier
hi! link typescriptArrayMethod            Function
hi! link typescriptArrowFunc              Operator
hi! link typescriptArrowFuncArg           RunoFg
hi! link typescriptAssign                 Operator
hi! link typescriptBOMWindowProp          RunoFg
hi! link typescriptBinaryOp               Operator
hi! link typescriptBraces                 Delimiter
hi! link typescriptCall                   typescriptArrowFuncArg
hi! link typescriptClassHeritage          Type
hi! link typescriptClassName              Identifier
hi! link typescriptDateMethod             RunoPink
hi! link typescriptDateStaticMethod       Function
hi! link typescriptDecorator              RunoGreenItalic
hi! link typescriptDefaultParam           Operator
hi! link typescriptES6SetMethod           RunoPink
hi! link typescriptEndColons              Delimiter
hi! link typescriptEnum                   Type
hi! link typescriptEnumKeyword            Keyword
hi! link typescriptFuncComma              Delimiter
hi! link typescriptFuncKeyword            Keyword
hi! link typescriptFuncType               RunoFg
hi! link typescriptFuncTypeArrow          Operator
hi! link typescriptGlobal                 Type
hi! link typescriptGlobalMethod           RunoPink
hi! link typescriptGlobalObjects          Type
hi! link typescriptIdentifier             RunoFg
hi! link typescriptInterfaceHeritage      Type
hi! link typescriptInterfaceName          Identifier
hi! link typescriptInterpolationDelimiter Keyword
hi! link typescriptKeywordOp              Keyword
hi! link typescriptLogicSymbols           Operator
hi! link typescriptMember                 RunoFg
hi! link typescriptMemberOptionality      Special
hi! link typescriptObjectColon            Special
hi! link typescriptObjectLabel            RunoFg
hi! link typescriptObjectSpread           Operator
hi! link typescriptOperator               Operator
hi! link typescriptParamImpl              RunoFg
hi! link typescriptParens                 Delimiter
hi! link typescriptPredefinedType         Type
hi! link typescriptRestOrSpread           Operator
hi! link typescriptTernaryOp              Operator
hi! link typescriptTypeAnnotation         Special
hi! link typescriptTypeCast               Operator
hi! link typescriptTypeParameter          RunoFg
hi! link typescriptTypeReference          Type
hi! link typescriptUnaryOp                Operator
hi! link typescriptVariable               Keyword
hi! link typescriptVariableDeclaration    Identifier
hi! link typescriptBOM                    RunoFg
hi! link typescriptIdentifierName         Identifier
