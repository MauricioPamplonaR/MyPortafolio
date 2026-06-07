# Firestore

Guia de estructura de datos y permisos para el portafolio.

## Administrador

El administrador actual es:

```text
mauropam77@gmail.com
```

Este email aparece en:

- `firestore.rules`
- `lib/constans/app_admin.dart`

Si cambia el correo admin, actualizar ambos lugares.

## Coleccion `projects`

Los proyectos se leen publicamente y solo el admin puede escribir.

Estructura esperada:

```json
{
  "name": {
    "es": "MOOV - Tu viaje, a tu manera",
    "en": "MOOV - Your trip, your way"
  },
  "description": {
    "es": "Descripcion en espanol",
    "en": "English description"
  },
  "image_url": "https://...",
  "link": "https://...",
  "apk_url": "https://..."
}
```

Notas:

- `name` debe ser un mapa con claves `es` y `en`.
- `description` debe ser un mapa con claves `es` y `en`.
- `image_url` debe ser URL publica o con token de Firebase Storage.
- `link` debe apuntar al repositorio, landing o demo.
- `apk_url` es opcional. Si existe y es `http` o `https`, la card muestra el boton `Descargar APK`.
- Evitar espacios en nombres de campos. Por ejemplo, `apk_url` es correcto; `  apk_url` no funciona.

## Coleccion `recommendations`

Las recomendaciones son creadas por usuarios autenticados con Google y quedan pendientes hasta aprobacion.

Estructura:

```json
{
  "author_name": "Nombre",
  "author_email": "correo@example.com",
  "author_photo_url": "https://...",
  "content": "Texto de recomendacion",
  "relationship": "Cliente",
  "created_at": "timestamp",
  "approved": false,
  "verified": false,
  "pinned": false,
  "likes_count": 0,
  "comments_count": 0
}
```

Reglas principales:

- Usuarios autenticados pueden crear recomendaciones propias.
- Las recomendaciones nuevas deben iniciar con `approved: false`.
- Solo recomendaciones aprobadas son visibles publicamente.
- El admin puede aprobar, editar o eliminar.

## Likes

Los likes viven en subcoleccion:

```text
recommendations/{recommendationId}/likes/{userId}
```

Estructura:

```json
{
  "recommendation_id": "recommendationId",
  "user_id": "firebaseAuthUid",
  "created_at": "timestamp"
}
```

Reglas principales:

- El usuario debe estar autenticado.
- El documento debe tener como ID el `uid` del usuario.
- Un usuario solo puede tener un like por recomendacion.
- El mismo usuario puede eliminar su propio like.

## Comentarios

Los comentarios viven en subcoleccion:

```text
recommendations/{recommendationId}/comments/{commentId}
```

Estructura actual:

```json
{
  "author_name": "Nombre",
  "author_email": "correo@example.com",
  "author_photo_url": "https://...",
  "content": "Texto del comentario",
  "created_at": "timestamp"
}
```

Estado actual:

- Los comentarios requieren usuario autenticado.
- El email del comentario debe coincidir con el email del token.
- Solo se permiten comentarios sobre recomendaciones aprobadas.
- Los comentarios se publican directamente.
- No existe aprobacion/rechazo de comentarios todavia.

Para moderar comentarios en el futuro se recomienda agregar:

- Campo `approved`.
- Consulta admin de comentarios pendientes.
- Acciones aprobar/eliminar en `/admin`.
- Reglas que oculten comentarios no aprobados a usuarios publicos.

## Panel Admin

Ruta:

```text
/admin
```

Acceso:

- Visible desde el footer solo si el usuario logueado es admin.
- Protegido tambien en la pagina admin.
- Firestore rules protegen las escrituras admin.

Funciones actuales:

- Ver recomendaciones pendientes.
- Aprobar recomendaciones.
- Eliminar recomendaciones.

Pendiente:

- Moderacion de comentarios.
