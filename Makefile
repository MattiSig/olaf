all: Lexer.class Parser.class ParserVal.class

test: all
	java Parser test.s > test.masm
	java -jar morpho.jar -c test.masm
	java -jar morpho.jar test

Lexer.class Parser.class ParserVal.class: Lexer.java Parser.java ParserVal.java
	javac Lexer.java Parser.java ParserVal.java

Lexer.java: Lexer.jflex
	java -jar jflex-1.6.1.jar Lexer.jflex

Parser.java ParserVal.java: Parser.byaccj
	./byacc -Jclass=Parser Parser.byaccj

clean:
	del *.class *~ *.java *.bak yacc.* *.masm *.mexe
