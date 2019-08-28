import java.io.*;

enum TokenType{NUM, SOMA, MULT, SUB, DIV, APar, FPar, EOF}

class Token{
  String lexema;
  TokenType token;

 Token (String l, TokenType t)
 	{ lexema=l;token = t;}	

}

class AnaliseLexica {
	BufferedReader arquivo;
	AnaliseLexica(String a) throws Exception {
	 	this.arquivo = new BufferedReader(new FileReader(a));
	}

	Token getNextToken() throws Exception {	
		int eof = -1;
		char currchar;
		int currchar1;
		String token = "";

			do {
				currchar1 =  arquivo.read();
				currchar = (char) currchar1;
			} while (currchar == '\n' || currchar == ' ' || currchar =='\t' || currchar == '\r');
			
			if(currchar1 != eof && currchar1 !=10) {	
				if (currchar >= '0' && currchar <= '9'){
					do {
						arquivo.mark(2);
						token += String.valueOf(currchar);
						currchar = (char) arquivo.read(); /* Find next character */
					} while (currchar >= '0' && currchar <= '9');
					arquivo.reset(); /* Return 1 character */
					return (new Token (token, TokenType.NUM));
				}
				else {
					token = "" + currchar;
					switch (currchar) {
						case '(':
							return (new Token (token,TokenType.APar));
						case ')':
							return (new Token (token,TokenType.FPar));
						case '+':
							return (new Token (token,TokenType.SOMA));
						case '*':
							return (new Token (token,TokenType.MULT));
						case '/':
							return (new Token (token,TokenType.DIV));
						case '-':
							return (new Token (token,TokenType.SUB));
						
						default: throw (new Exception("Caractere inválido: " + ((int) currchar)));
					}
				}
			}

		arquivo.close();

		return (new Token(token,TokenType.EOF));
		
	}
}
