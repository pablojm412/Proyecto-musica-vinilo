#include "crow_all.h"
#include "include/modelos.hpp"
#include <pqxx/pqxx> 
#include <iostream>

int main() {
    crow::SimpleApp app;

    
    CROW_ROUTE(app, "/")([](){
        return "Servidor de Vinilos de Pablo funcionando!";
    });

    
    CROW_ROUTE(app, "/vinilos")([](){
        try {
            
            pqxx::connection C("dbname=tienda_vinilos user=postgres password=tu_password host=localhost");
            pqxx::work W(C);
            pqxx::result R = W.exec("SELECT id, titulo, artista, precio FROM vinilos");

            std::vector<crow::json::wvalue> lista_vinilos;
            for (auto const &row : R) {
                lista_vinilos.push_back({
                    {"id", row[0].as<int>()},
                    {"titulo", row[1].as<std::string>()},
                    {"artista", row[2].as<std::string>()},
                    {"precio", row[3].as<double>()}
                });
            }
            return crow::response(crow::json::wvalue(lista_vinilos));
        } catch (const std::exception &e) {
            return crow::response(500, e.what());
        }
    });

    std::cout << "Servidor corriendo en http://localhost:8080" << std::endl;
    app.port(8080).multithreaded().run();
}
