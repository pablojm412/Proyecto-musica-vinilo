#ifndef MODELOS_HPP
#define MODELOS_HPP

#include <string>
#include <vector>


struct Genero {
    int id;
    std::string nombre;
    std::string subgenero;
};


struct Vinilo {
    int id;
    std::string titulo;
    std::string artista;
    int anio;
    double precio;
    int stock;
    int genero_id;
};

#endif
