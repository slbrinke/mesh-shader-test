cmake_minimum_required(VERSION 3.19)
project(MeshShaderTest)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

find_package(Vulkan REQUIRED)

add_subdirectory(${CMAKE_SOURCE_DIR}/glfw)
include_directories(${CMAKE_SOURCE_DIR}/glfw/include)

configure_file(${CMAKE_SOURCE_DIR}/src/path_config.h.in ${CMAKE_SOURCE_DIR}/src/path_config.h)

add_executable(${PROJECT_NAME})
target_sources(${PROJECT_NAME} PUBLIC src/main.cpp)

target_include_directories(${PROJECT_NAME} PUBLIC ${Vulkan_INCLUDE_DIRS})
target_link_libraries(${PROJECT_NAME} PUBLIC ${Vulkan_LIBRARIES} glfw)
