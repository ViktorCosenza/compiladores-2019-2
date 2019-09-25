all: Karloff.jj
	javacc Karloff.jj && javac *.java && java Karloff teste.k


test: 
	java Karloff teste.k

clean:
	rm -rf *.java *.class
