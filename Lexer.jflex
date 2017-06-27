%% 
%public
%class Lexer
%unicode
%byaccj
%line
%column

%{

public Parser yyparser;

public Lexer (java.io.Reader r, Parser yyparser )
{
	this (r);
	this.yyparser = yyparser;
}

public int getLine() {
	return yyline;
}

%}

/* reglulegar skilgreiningar */
	
_DIGIT=[0-9]
_FLOAT={_DIGIT}+\.{_DIGIT}+([eE][+-]?{_DIGIT}+)?
_INT={_DIGIT}+
_STRING=\"([^\"\\]|\\b|\\t|\\n|\\f|\\r|\\\"|\\\'|\\\\|(\\[0-3][0-7][0-7])|\\[0-7][0-7]|\\[0-7])*\"
_CHAR=\'([^\'\\]|\\b|\\t|\\n|\\f|\\r|\\\"|\\\'|\\\\|(\\[0-3][0-7][0-7])|(\\[0-7][0-7])|(\\[0-7]))\'
_DELIM=[{}(),;=]
_NAME=[:letter:]+ ([:letter:]|{_DIGIT})*
_OPERATOR= [\+\-*/!%&=><\:\^\~&|?]+

%%

{_DELIM} {
	yyparser.yylval = new ParserVal(yytext());
	return yycharat(0);
}

{_STRING} | {_FLOAT} | {_CHAR} | {_INT} | null | true | false {
	yyparser.yylval = new ParserVal(yytext());
	return Parser.LITERAL;
}

{_OPERATOR} {
	yyparser.yylval = new ParserVal(yytext());
	return Parser.OPNAME;
}

"if" {
	yyparser.yylval = new ParserVal(yytext());
	return Parser.IF;
}

"else" {
	yyparser.yylval = new ParserVal(yytext());
	return Parser.ELSE;
}

"elseif" {
	yyparser.yylval = new ParserVal(yytext());
	return Parser.ELSEIF;
}

"while" {
	yyparser.yylval = new ParserVal(yytext());
	return Parser.WHILE;
}

"return" {
	yyparser.yylval = new ParserVal(yytext());
	return Parser.RETURN;
}

"var" {
	yyparser.yylval = new ParserVal(yytext());
	return Parser.VAR;
}

{_NAME} {
	yyparser.yylval = new ParserVal(yytext());
	return Parser.NAME;
}

";;;".*$ {
}

[ \t\r\n\f] {
}

. {
	return Parser.YYERRCODE;
}