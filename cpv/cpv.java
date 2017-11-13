import java.io.FileReader;
import java.io.IOException;

public class cpv {
    protected static int sumaA = 0;
    protected static int sumaB = 0;
    protected static int sumaC = 0;
    protected static int sumaD = 0;
    
    public static void addA() {
    	sumaA ++;
    }

    public static void addB() {
    	sumaB ++;
    }

    public static void addC() {
    	sumaC ++;
    }

    public static void addD() {
    	sumaD ++;
    }
    
    public static int getSumaA() {
    	return sumaA;
    }

    public static int getSumaB() {
    	return sumaB;
    }

    public static int getSumaC() {
    	return sumaC;
    }

    public static int getSumaD() {
    	return sumaD;
    }
    
    public static void reset() {
        sumaA = 0;	
	sumaB = 0;
	sumaC = 0;
	sumaD = 0;
    }
    
    
    public static void main(String arg[]) {
    
        if (arg.length>0) {
            try {
                Yylex lex = new Yylex(new FileReader(arg[0]));
                Yytoken yytoken = null;
		while (  (yytoken = lex.yylex()) != null  ) {
                    //System.out.println(yytoken);
                    if (yytoken.getToken() == Yytoken.A)  {
                       cpv.addA();
                    } else if (yytoken.getToken() == Yytoken.B) {
		       cpv.addB();
                    } else if (yytoken.getToken() == Yytoken.C) {
                       cpv.addC();
                    } else if (yytoken.getToken() == Yytoken.D) {
                       cpv.addD();
                    } 
                }
		System.out.println("A " + cpv.getSumaA());
		System.out.println("B " + cpv.getSumaB());
		System.out.println("C " + cpv.getSumaC());
		System.out.println("D " + cpv.getSumaD());
                cpv.reset();
	    } catch (IOException e) {
	    }
        }
    }

}
