DIGIT	[0-9]
CHAR	[a-zA-Z]
ID	{CHAR}({CHAR}|{DIGIT})*	
BOOL "True"|"False"
BINARY_OP "&&"|"<"|"+"|"-"|"*"
AR_OP "=="|"<="|">="|">"|"<"
RESERVED_WORD "public"|"static"|"if"|"else"|"while"|"System.out.println"|"int"|"float"|"bool"|"String"|"class"|"void"
MAIN "main"

ATRIB "="
OPEN_BRACKET "{"
CLOSE_BRACKET "}"
OPEN_BRACE "["
CLOSE_BRACE "]"
OPEN_PARENTHESIS "("
CLOSE_PARENTHESIS ")"
END_LINE ";"

%%
{BOOL}               { printf("bool: %s\n", yytext); }
{BINARY_OP}          { printf("binary_op %s\n", yytext); }
{AR_OP}              { printf("arithimitic_op %s\n", yytext); }
{OPEN_BRACKET}       { printf("open_bracket %s\n", yytext); }
{CLOSE_BRACKET}      { printf("close_bracket %s\n", yytext); }
{OPEN_BRACE}         { printf("open_brace %s\n", yytext); }
{CLOSE_BRACE}        { printf("close_brace %s\n", yytext); }
{OPEN_PARENTHESIS}   { printf("open_parenthesis %s\n", yytext); }
{CLOSE_PARENTHESIS}  { printf("close_parenthesis %s\n", yytext); }
{END_LINE}           { printf("end_line %s\n", yytext); }
{RESERVED_WORD}      { printf("reserved_word %s\n", yytext); }
{ATRIB}              { printf("atrib %s\n", yytext); }       

{DIGIT}+		          { printf("int: %s\n",yytext); }
{DIGIT}+"."{DIGIT}+   { printf("float: %s\n",yytext); } 
{ID}			            { printf("var: %s\n",yytext); }

%%


int yywrap();

int  main() {
  yylex();
  return 1;
}

int yywrap(){
 return 1;
}
