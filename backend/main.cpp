#include <iostream>
#include "incluir/modelos.hpp" 

int main() {
    
    Vinilo miVinilo;
    miVinilo.id = 1;
    miVinilo.titulo = "The Wall";
    miVinilo.artista = "Pink Floyd";
    miVinilo.precio = 5200.00;

    std::cout << "--- Servidor de Vinilos levantado ---" << std::endl;
    std::cout << "Cargando disco: " << miVinilo.titulo << " de " << miVinilo.artista << std::endl;

    return 0;
}
