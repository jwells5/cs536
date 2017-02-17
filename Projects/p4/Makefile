JC = javac
CP = ~cs536-1/public/tools/deps_src/java-cup-11b.jar:~cs536-1/public/tools/deps_src/java-cup-11b-runtime.jar:~cs536-1/public/tools/deps:.
CP2 = ~cs536-1/public/tools/deps:.

P4.class: P4.java parser.class Yylex.class ASTnode.class
	$(JC)    P4.java

parser.class: parser.java ASTnode.class Yylex.class ErrMsg.class
	$(JC)      parser.java

parser.java: moo.cup
	java   java_cup.Main < moo.cup

Yylex.class: moo.jlex.java sym.class ErrMsg.class
	$(JC)   moo.jlex.java

ASTnode.class: ast.java
	$(JC)  ast.java

moo.jlex.java: moo.jlex sym.class
	java    JLex.Main moo.jlex

sym.class: sym.java
	$(JC)    sym.java

sym.java: moo.cup
	java    java_cup.Main < moo.cup

ErrMsg.class: ErrMsg.java
	$(JC) ErrMsg.java

##test
test:
	java P4 test.moo test.out
	java P4 nameErrors.moo nameErrors.out

###
# clean
###
clean:
	rm -f *~ *.class *.out parser.java moo.jlex.java
