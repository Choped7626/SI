package es.udc.sistemasinteligentes;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;

public class Mainej1 {

    public static void main(String[] args) throws Exception {
        ProblemaAspiradora.EstadoAspiradora estadoInicial = new ProblemaAspiradora.EstadoAspiradora(ProblemaAspiradora.EstadoAspiradora.PosicionRobot.IZQ,
                ProblemaAspiradora.EstadoAspiradora.PosicionBasura.AMBAS);
        ProblemaBusqueda aspiradora = new ProblemaAspiradora(estadoInicial);

        EstrategiaBusqueda buscador = new Estrategia4();
        System.out.println(Arrays.toString(buscador.soluciona(aspiradora)));

        EstrategiaBusqueda busqueda2 = new EstrategiaBusquedaGrafo();
        Nodo[] solucion = buscador.soluciona(aspiradora);
        ArrayList<Nodo> listaNodos = new ArrayList<>(Arrays.asList(solucion));
        Collections.reverse(listaNodos);
        for(Nodo i : listaNodos)
            System.out.println(i.toString());
    }
}