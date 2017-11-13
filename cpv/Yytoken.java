public class Yytoken {
    public final static int A = 1;
    public final static int B = 2;
    public final static int C = 3;
    public final static int D = 4;

    private int token;
    private String valor;

    public Yytoken(int token, String valor) {
         this.token = token;
         this.valor = valor;
    }

    public int getToken()  {
         return token;
    }

    public String getValor() {
         return valor;
    }

    public String toString() {
         return "<"+token+","+valor+">";
    }
}
