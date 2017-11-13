import java.io.FileReader;
import java.io.IOException;

public class wc {
    protected static int caracteres = 0;
    protected static int palabras = 0;
    protected static int lineas = 0;
    
    public static void addCaracteres() {
	caracteres++;
    }

    public static void addPalabras(String palabra) {
	palabras++;
	caracteres += palabra.length();
    }

    public static void addLineas() {
	lineas++;
	caracteres++;
    }
    
    public static int getCaracteres() {
    	return caracteres;
    }

    public static int getPalabras() {
    	return palabras;
    }

    public static int getLineas() {
    	return lineas;
    }
    
    public static void reset() {
        caracteres = 0;
	palabras = 0;
	lineas = 0;	
    }
    
    
    public static void main(String arg[]) {
    
        if (arg.length>0) {
            try {
                Yylex lex = new Yylex(new FileReader(arg[0]));
                Yytoken yytoken = null;
		while (  (yytoken = lex.yylex()) != null  ) {
                    //System.out.println(yytoken);
                    if (yytoken.getToken() == Yytoken.ESPACIO)  {
                       wc.addCaracteres();
                    } else if (yytoken.getToken() == Yytoken.LINEA) {
		       wc.addLineas();
                    } else if (yytoken.getToken() == Yytoken.PALABRA) {
		       wc.addPalabras(yytoken.getValor());
                    } 
                }
		System.out.println(wc.getLineas() + "	" + wc.getPalabras() + "   " + wc.getCaracteres() + " 	" + arg[0]);
                wc.reset();
	    } catch (IOException e) {
	    }
        }
    }

}
