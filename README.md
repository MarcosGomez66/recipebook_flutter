# 📖 Recipe Book

Una aplicación Flutter para ver y gestionar recetas de cocina.  
Permite visualizar recetas desde una API local (Mockoon) y marcar tus favoritas.  
Proyecto creado como práctica para aprender Flutter, Provider y consumo de APIs.

---

## 🚀 Características

- 📡 Conexión a una API simulada con **Mockoon**
- ❤️ Sistema de recetas favoritas
- 📝 Agregar recetas nuevas con formulario (proximamente)
- 🔄 Actualización automática del listado mediante **Provider**
- 🎨 Interfaz moderna con Material Design

---

## 🛠️ Tecnologías utilizadas

- **Flutter**
- **Dart**
- **Provider** para gestión de estado
- **HTTP** para consumo de API REST
- **Mockoon** (API local simulada)
- **Android Studio / VS Code**

## Respuesta de la API en Mockoon (/recipes)

{
"recipes": [
{
"id": 1,
"name": "Espaguetis a la Carbonara",
"author": "Chef María López",
"image_link": "https://static.platzi.com/media/uploads/Espagueti_2619917177.jpeg",
"recipe": [
"Cuece los espaguetis en agua con sal hasta que estén al dente.",
"En un bol, bate huevos y añade queso parmesano rallado.",
"Fríe panceta en una sartén hasta que esté crujiente.",
"Mezcla los espaguetis con la panceta y la mezcla de huevo y queso.",
"Sirve con más queso y pimienta negra al gusto."
]
},
{
"id": 2,
"name": "Ensalada César",
"author": "Chef Juan Martínez",
"image_link": "https://static.platzi.com/media/uploads/cesar_858569da19.jpeg",
"recipe": [
"Lava y corta la lechuga romana.",
"Añade crutones y queso parmesano rallado.",
"Prepara la salsa con mayonesa, ajo, limón, anchoas y queso parmesano.",
"Vierte la salsa sobre la lechuga y mezcla bien.",
"Agrega más parmesano al gusto antes de servir."
]
}
}
