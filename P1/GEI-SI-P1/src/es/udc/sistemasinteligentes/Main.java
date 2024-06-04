package es.udc.sistemasinteligentes;

import java.util.Arrays;

public class Main {

    public static void main(String[] args) throws Exception {
        ProblemaAspiradora.EstadoAspiradora estadoInicial = new ProblemaAspiradora.EstadoAspiradora(ProblemaAspiradora.EstadoAspiradora.PosicionRobot.IZQ,
                                                                                                    ProblemaAspiradora.EstadoAspiradora.PosicionBasura.AMBAS);
        ProblemaBusqueda aspiradora = new ProblemaAspiradora(estadoInicial);

        EstrategiaBusqueda buscador = new Estrategia4();
        System.out.println(Arrays.toString(buscador.soluciona(aspiradora)));

        EstrategiaBusqueda busqueda2 = new EstrategiaBusquedaGrafo();
        System.out.println(Arrays.toString(busqueda2.soluciona(aspiradora)));
    }
}
