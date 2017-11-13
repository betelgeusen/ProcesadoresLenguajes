

%%


%%

/*palabras que deberian ir a A, se meten en B (que)
*/

[a-zA-Z]*(a|e|i|o|u|A|E|I|O|U){2, 2}[a-zA-Z]*[aeiouAEIOU] | [a-zA-Z]*(a|e|i|o|u|A|E|I|O|U){2, 2}	{ return new Yytoken(Yytoken.A, "A" + yytext()); }

[a-zA-Z]*(a|e|i|o|u|A|E|I|O|U){2, 2}[a-zA-Z]+        	 						{ return new Yytoken(Yytoken.C, "C" + yytext()); }  

[a-zA-Z]+[aeiouAEIOU]         										{ return new Yytoken(Yytoken.B, "B" + yytext()); } 

[a-zA-Z]+          											{ return new Yytoken(Yytoken.D, "D" + yytext()); } 

.|\n													{ }
