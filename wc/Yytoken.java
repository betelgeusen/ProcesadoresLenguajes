public class Yytoken {
    public final static int ESPACIO = 99;
    public final static int PALABRA = 100;
    public final static int LINEA = 101;

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
