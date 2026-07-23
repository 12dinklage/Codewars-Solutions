/*
Instructions:
Implement a function that computes the difference between two lists. The function should remove all occurrences of elements from the first list (a) that are present in the second list (b). The order of elements in the first list should be preserved in the result.

Examples
If a = [1, 2] and b = [1], the result should be [2].

If a = [1, 2, 2, 2, 3] and b = [2], the result should be [1, 3].
 */
public class Kata {
    //Prueba
    public static void main(String[] args) {
        //Esta es la parte que hay que editar para hace pruebas
        int[] vectorDprueba =arrayDiff(new int [] {0,1,2}, new int[] {1});

        // Imprimimos el vector
        System.out.print("Vector retornado: ");
        for (int i = 0; i < vectorDprueba.length; i++) {
            System.out.print(vectorDprueba[i] + " ");
        }
    }
    //Solution
    public static int[] arrayDiff(int[] a, int[] b) {
        // Your code here
        int cont = 0;
        boolean bool;
        if(b.length==0 || a.length==0){
            return a;
        }
        else{
            for(int i=0; i<a.length; i++){
                bool = true;
                for(int j=0; j<b.length; j++){
                    if(b[j]==a[i]){
                        bool = false;
                        break;
                    }
                }
                if(bool==true){
                    cont++;
                }
            }
            return nuevaLista(cont,a,b);
        }
    }


    public static int[] nuevaLista (int cont, int[] a, int[] b){
        int[] c = new int[cont];
        boolean bool;
        int k=0;
        for(int i=0; i<a.length; i++){
            bool = true;
            for(int j=0; j<b.length; j++){
                if(b[j]==a[i]){
                    bool = false;
                    break;
                }
            }
            if(bool==true){
                c[k] = a[i];
                k++;
            }
        }
        return c;
    }
}