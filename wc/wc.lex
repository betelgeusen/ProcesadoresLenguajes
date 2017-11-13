

%%



%%




\n			        { return new Yytoken(Yytoken.LINEA, yytext()); }
[^\n\t\f\r\ ]+			{ return new Yytoken(Yytoken.PALABRA, yytext()); }  
.				{ return new Yytoken(Yytoken.ESPACIO, yytext()); }
