# Intertest

Prueba Técnica - App Intertest

# Descripción
Esta aplicación iOS es una demostración técnica que muestra información de usuario, tablas y localidades utilizando la API de interrapidisimo.
El proyecto implementa principios de Clean Architecture con el patrón mvvm, enfatizando la calidad del código, la capacidad de prueba y la mantenibilidad.

# Especificaciones Técnicas

- Plataforma: iOS 15.6+
- Lenguaje: Swift 5
- Framework UI: SwiftUI
- Arquitectura: Clean Architecture + mvvm
- Inyección de Dependencias: Contenedor DI personalizado, Resolver

# Arquitectura

Clean Architecture con el patron arquitectonico mvvm

- Capa de Datos: Maneja operaciones de datos y servicios externos
- Capa de Dominio: Contiene la lógica de negocio y entidades
- Capa de Presentación: Implementa módulos mvvm y componentes UI

# Implementación VIPER

- Vista: Maneja elementos UI e interacciones del usuario
- Use case: Contiene lógica de negocio
- ViewModel: Gestiona la lógica de la Vista y el formato de datos
- Entidad: Representa modelos de datos

# Características

- Vista home
- Vista de tablas con función de búsqueda
- Vista de localidades con función búsqueda

# Dependencias

- Resolver
- SkeletonUI

# Estrategia de Pruebas

- Pruebas Unitarias (XCTest)
- Cobertura completa para todos los modulos 

# Cobertura de Código
  
  Cobertura general: 72,2%
  ![Screenshot 2025-06-05 at 1 34 07 PM](https://github.com/user-attachments/assets/2abeb7ef-26f2-45f2-b977-cca4b03b4961)


# Instrucciones de Instalación

1. Clonar el repositorio
2. Abrir el proyecto interTest.xcodeproj
3. Esperar que se descargen las dependencias de spm
4. Compilar y ejecutar

# Ejecución de Pruebas

1. Abrir el proyecto InterTest.xcodeproj
2. Seleccionar el esquema de pruebas InterTestTests
3. Presionar Cmd + U para ejecutar las pruebas
4. Ver el informe de cobertura en Xcode

# Prácticas de Desarrollo

- Implementación de principios SOLID
- Inyección de Dependencias para mejor capacidad de prueba
- Programación orientada a protocolos
- Arquitectura modular (Mvvm + Clean Arquitecture)
- Inyeccion de dependencias
- POO
- Vistas con SwiftUi y NavigationStack 

# PrintScreen App
![Simulator Screenshot - iPhone 16 Pro Max - 2025-06-05 at 13 34 42](https://github.com/user-attachments/assets/7a96f642-a439-4127-80c6-46ca0ac6eacf)
![Simulator Screenshot - iPhone 16 Pro Max - 2025-06-05 at 13 34 45](https://github.com/user-attachments/assets/fe428a12-6049-4179-bc32-39999709742e)
![Simulator Screenshot - iPhone 16 Pro Max - 2025-06-05 at 13 34 47](https://github.com/user-attachments/assets/348348f5-c302-4a8c-a14e-1c7d96be0fdf)
![Simulator Screenshot - iPhone 16 Pro Max - 2025-06-05 at 13 34 52](https://github.com/user-attachments/assets/8ddbae8c-e3ee-4900-81e0-0a855e6705be)


