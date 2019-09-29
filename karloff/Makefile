all: Karloff.jj
	javacc Karloff.jj && javac *.java


test: 
	java Karloff teste.k

clean:
	rm -rf *.java *.class
