# MyPortafolio

Portafolio web de Mauricio Pamplona Suarez construido con Flutter Web, Firebase y Firestore.

El proyecto muestra perfil profesional, proyectos, formacion, recomendaciones, comentarios autenticados y canales de contacto. Tambien incluye un panel privado para revisar recomendaciones pendientes.

## Stack

- Flutter Web / Dart
- GoRouter
- Riverpod
- Firebase Core
- Firebase Auth con Google
- Cloud Firestore
- Firebase Hosting
- Flutter SVG
- Freezed / JSON Serializable
- Urbanist como fuente principal

## Funcionalidades

- Rutas limpias sin `#` usando `usePathUrlStrategy()`.
- Sitio bilingue ES/EN.
- Modo claro y oscuro.
- Pagina de proyectos desde Firestore.
- Campo opcional `apk_url` para mostrar boton de descarga APK por proyecto.
- Pagina de contacto con WhatsApp, correo, LinkedIn y GitHub.
- Recomendaciones creadas por usuarios autenticados.
- Likes y comentarios disponibles solo para usuarios identificados.
- Panel admin visible solo para `mauropam77@gmail.com`.
- Aprobacion o eliminacion de recomendaciones pendientes desde `/admin`.

## Estado De Moderacion

Actualmente el panel admin modera recomendaciones pendientes:

- Las recomendaciones nuevas se crean con `approved: false`.
- El admin puede aprobarlas o eliminarlas.
- Solo recomendaciones aprobadas son visibles publicamente.

Los comentarios no tienen flujo de aprobacion todavia. Hoy se publican directamente bajo recomendaciones aprobadas, siempre que el usuario este autenticado.

## Rutas

Las rutas principales son:

- `/`
- `/about`
- `/projects`
- `/contact`
- `/profile`
- `/admin`

Firebase Hosting tiene rewrite SPA hacia `/index.html`, por eso los enlaces directos como `/projects` funcionan sin `#`.

## Configuracion Local

Instalar dependencias:

```bash
flutter pub get
```

Ejecutar validaciones:

```bash
flutter analyze
flutter test
```

Generar build web:

```bash
flutter build web --release --no-web-resources-cdn
```

## Firebase

Proyecto Firebase:

- Project ID: `my-portafolio-922dc`
- Hosting: `https://my-portafolio-922dc.web.app`
- Console: `https://console.firebase.google.com/project/my-portafolio-922dc/overview`

El archivo `lib/firebase_options.dart` contiene la configuracion generada por FlutterFire.

## Firestore

Colecciones principales:

- `projects`
- `education` / `educations`
- `recommendations`

Subcolecciones:

- `recommendations/{recommendationId}/likes/{userId}`
- `recommendations/{recommendationId}/comments/{commentId}`

Ver detalles de estructura y reglas en [docs/FIRESTORE.md](docs/FIRESTORE.md).

## Despliegue

Ver [DEPLOY.md](DEPLOY.md).
