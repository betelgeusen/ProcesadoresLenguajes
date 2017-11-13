

%%

Entero = 0|[1-9][0-9]*
Octal = 0[0-7]+
Hexadecimal = 0x[0-9a-fA-F]+
Decimal = [0-9]*\.[0-9]+|[0-9]+\.[0-9]*
Exponente = ({Decimal}|{Entero}|{Octal})(E|e)(\-|\+){0, 1}({Entero}|{Octal}|{Hexadecimal})
DecimalE = {Decimal}|{Exponente}


RealCorto = {DecimalE}(f|F)
RealLargo = {DecimalE}(d|D){0, 1}
EnteroLargo = ({Entero}|{Octal}|{Hexadecimal})(l|L)
EnteroCorto = ({Octal}|{Entero}|{Hexadecimal})



%%



{RealCorto}						{ return new Yytoken(Yytoken.TOKEN_CTE_REAL_CORTO, yytext()); }


{RealLargo}						{ return new Yytoken(Yytoken.TOKEN_CTE_REAL_LARGO, yytext()); }


{EnteroLargo}						{ return new Yytoken(Yytoken.TOKEN_CTE_ENTERO_LARGO, yytext()); }


{EnteroCorto}						{ return new Yytoken(Yytoken.TOKEN_CTE_ENTERO, yytext()); }


//Error
[^\n\t\f\r\ ]+						{ return new Yytoken(Yytoken.TOKEN_ERROR, yytext()); }


//Whitespace y EOL
.|\n							{ }


