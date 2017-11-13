%%
%int
%state PANTALLA, COMILLASV, COMILLASP

%{
	String id = new String(), var = new String();
%}

Identificador = [a-zA-Z_][a-zA-Z_0-9]*

ConComilla = ([a-zA-Z0-9]+|(\\\$)|(\\\;)|(\\\"))*
SinComilla = ([a-zA-Z0-9]+|(\\\$)|(\\\;)|(\\\"))+

%%

"echo "				{ System.out.print(yytext());
				  yybegin(PANTALLA); }

<PANTALLA>{
	\${Identificador}	{ System.out.print(TablaSimbolos.get(yytext())); }
	{SinComilla}		{ System.out.print(yytext()); }
	\"			{ System.out.print(yytext());
				  yybegin(COMILLASP); }
	.|\n 			{ System.out.print(yytext()); }
}

<COMILLASV>{
	\${Identificador}	{ var += TablaSimbolos.get(yytext()); }
	{ConComilla}		{ var += yytext(); }
	\"			{ TablaSimbolos.put(id, var);
				  var = new String();
				  yybegin(YYINITIAL); }
	.			{ var += yytext(); }
}

<COMILLASP>{
	{ConComilla}		{ var += yytext(); }
	\${Identificador}	{ var += TablaSimbolos.get(yytext()); }
	\"			{ var += yytext();
				  System.out.print(var);
				  var = new String();
				  yybegin(PANTALLA); }
	.			{ var += yytext(); }
}

<YYINITIAL>{
	{Identificador}/=	{ id = yytext(); }
	[;=\ ]			{ }
	{SinComilla}		{ TablaSimbolos.put(id, yytext()); }
	\"			{ yybegin(COMILLASV); }
	\n			{ }
}

.|\n				{ }
