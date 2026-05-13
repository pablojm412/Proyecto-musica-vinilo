cmake_minimum_required(VERSION 3.10)
project(ProyectoVinilos)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(PostgreSQL REQUIRED)
find_package(libpqxx REQUIRED)

include_directories(include)

add_executable(server_vinilos main.cpp)

target_link_libraries(server_vinilos PRIVATE PostgreSQL::PostgreSQL libpqxx::pqxx)
