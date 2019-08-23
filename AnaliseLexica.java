import java.io.*;

enum TokenType{NUM, SOMA, MULT, SUB, DIV, APar, FPar, EOF}

class Token{
  char lexema;
  TokenType token;

 Token (char[] l, TokenType t)
 	{ lexema=l[0];token = t;}	

}

class AnaliseLexica {
	BufferedReader arquivo;
	AnaliseLexica(String a) throws Exception {
	 	this.arquivo = new BufferedReader(new FileReader(a));
	}

	Token getNextToken() throws Exception
	{	
		Token token;
		int eof = -1;
		char currchar;
		int currchar1;

		char[] tokenContent;
		String numberStream = "";

			do {
				currchar1 =  arquivo.read();
				currchar = (char) currchar1;
			} while (currchar == '\n' || currchar == ' ' || currchar =='\t' || currchar == '\r');
			
			if(currchar1 != eof && currchar1 !=10) {	
				arquivo.mark(2);
				tokenContent = new char[1]; /* Dinamic Size */
				tokenContent[0] = currchar;

				if (currchar >= '0' && currchar <= '9'){
					while (currchar >= '0' && currchar <= '9') {
						arquivo.mark(2)
						numberStream.append(currchar);
						
						currchar = (char) arquivo.read() /* Find next character */
					}
					arquivo.reset() /* Return 1 character */
					return (new Token (tokenContent, TokenType.NUM));
				}
				else {
					tokenContent = new char[1];
					tokenContent[0] = currchar;
					switch (tokenContent[0]) {
						case '(':
							return (new Token (tokenContent,TokenType.APar));
						case ')':
							return (new Token (tokenContent,TokenType.FPar));
						case '+':
							return (new Token (tokenContent,TokenType.SOMA));
						case '*':
							return (new Token (tokenContent,TokenType.MULT));
						case '/':
							return (new Token (tokenContent,TokenType.DIV));
						case '-':
							return (new Token (tokenContent,TokenType.SUB));
						
						default: throw (new Exception("Caractere inválido: " + ((int) tokenContent[0])));
					}
				}
			}

		arquivo.close();
		tokenContent = new char[1];
		tokenContent[0] = currchar;	
		return (new Token(tokenContent,TokenType.EOF));
		
	}
}
