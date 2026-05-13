cmake_minimum_required(VERSION 3.10)
project(TiendaVinilos)


set(CMAKE_CXX_STANDARD 17)


include_directories(incluir)


find_package(PostgreSQL REQUIRED)


add_executable(api_vinilos main.cpp)


target_link_libraries(api_vinilos PostgreSQL::PostgreSQL)
