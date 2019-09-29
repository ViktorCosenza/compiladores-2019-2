class CodeGen{

	
	void geraCodigo (ArvoreSintatica arv)
	{
		System.out.println(geraCodigo2(arv));
	}
	double geraCodigo2 (ArvoreSintatica arv)
	{

	if (arv instanceof Mult)
		return ((double)geraCodigo2(((Mult) arv).arg1) * (double)geraCodigo2(((Mult) arv).arg2));

	if (arv instanceof Soma)
		return ((double)geraCodigo2(((Soma) arv).arg1) + (double)geraCodigo2(((Soma) arv).arg2));

	if (arv instanceof Div)
		return ((double)geraCodigo2(((Div) arv).arg1) / 
			(double)geraCodigo2(((Div) arv).arg2));

	if (arv instanceof Sub)
	return ((double)geraCodigo2(((Sub) arv).arg1) -
		(double)geraCodigo2(((Sub) arv).arg2));

	if (arv instanceof Num)
		return (double)((Num) arv).num;

	return -99999;
	}
}
