class Compilador{

	public static void main(String[]args) throws Exception {	
		ArvoreSintatica arv=null;
		try{
			AnaliseLexica al = new AnaliseLexica(args[0]);
			Parser as = new Parser(al);
		
			arv = as.parseProg();
			
			CodeGen backend = new CodeGen();
			String codigo = backend.geraCodigo(arv);
			System.out.println(codigo);

		}
		catch(Exception e) {			
			throw e;
		}
	}
}
