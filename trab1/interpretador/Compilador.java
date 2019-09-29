class Compilador{

	public static void main(String[]args) throws Exception {	
		ArvoreSintatica arv=null;
		try{
			AnaliseLexica al = new AnaliseLexica(args[0]);
			Parser as = new Parser(al);
		
			arv = as.parseProg();
			
			CodeGen backend = new CodeGen();
			backend.geraCodigo(arv);
		}
		catch(Exception e) {			
			throw e;
		}
	}
}
