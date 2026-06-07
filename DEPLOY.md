# Despliegue A Firebase Hosting

## URL de Producción

https://my-portafolio-922dc.web.app

## Proyecto Firebase

- Project ID: `my-portafolio-922dc`
- Console: https://console.firebase.google.com/project/my-portafolio-922dc/overview

## Antes De Desplegar

Ejecutar siempre:

```bash
flutter analyze
flutter test
flutter build web --release --no-web-resources-cdn
```

Validar reglas e indices si se tocaron Firestore:

```bash
firebase deploy --only firestore:rules --dry-run --project=my-portafolio-922dc
firebase deploy --only firestore:indexes --dry-run --project=my-portafolio-922dc
```

## Desplegar Hosting

Cuando solo cambia la app web:

```bash
firebase deploy --only hosting --project=my-portafolio-922dc
```

## Desplegar Hosting Y Firestore

Cuando tambien cambian reglas o indices:

```bash
flutter build web --release --no-web-resources-cdn
firebase deploy --only hosting,firestore:rules,firestore:indexes --project=my-portafolio-922dc
```

## Verificar Rutas Limpias

El proyecto usa `usePathUrlStrategy()`, por lo que las URLs publicas no deben tener `#`.

Correcto:

```text
https://my-portafolio-922dc.web.app/projects
https://my-portafolio-922dc.web.app/contact
```

No deseado:

```text
https://my-portafolio-922dc.web.app/#/projects
```

El rewrite SPA esta configurado en `firebase.json`:

```json
{
  "source": "**",
  "destination": "/index.html"
}
```

Para validar localmente con el Hosting Emulator:

```bash
flutter build web --release --no-web-resources-cdn
firebase emulators:exec --only hosting --project my-portafolio-922dc "curl -I http://127.0.0.1:5002/projects"
```

La respuesta esperada es `HTTP/1.1 200 OK`.

Si el emulador imprime otro puerto, reemplazar `5002` por el puerto mostrado en consola.

## Regenerar Configuracion FlutterFire

```bash
flutterfire configure \
  --project=my-portafolio-922dc \
  --platforms=web \
  --web-app-id=1:188798271906:web:c329123dc5fcf2a1c732fb \
  --out=lib/firebase_options.dart \
  --yes
```
