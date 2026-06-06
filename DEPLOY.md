# Despliegue a Firebase Hosting

## URL de Producción
https://my-portafolio-922dc.web.app

## Comando para desplegar
```bash
flutter build web --release --no-web-resources-cdn
firebase deploy --only hosting,firestore:rules --project=my-portafolio-922dc
```

## Validación antes de desplegar
```bash
flutter analyze
flutter test
flutter build web --release --no-web-resources-cdn
firebase deploy --only hosting,firestore:rules --dry-run --project=my-portafolio-922dc
```

## Regenerar configuración FlutterFire
```bash
flutterfire configure \
  --project=my-portafolio-922dc \
  --platforms=web \
  --web-app-id=1:188798271906:web:c329123dc5fcf2a1c732fb \
  --out=lib/firebase_options.dart \
  --yes
```

## Proyecto Firebase
- **Project ID:** my-portafolio-922dc
- **Console:** https://console.firebase.google.com/project/my-portafolio-922dc/overview
