
all: Linguagem.jj
	javacc Linguagem.jj && javac *.java

test: Linguagem.jj
	javacc Linguagem.jj && javac *.java && java Linguagem teste.txt

clean:
	rm *.java *.class
