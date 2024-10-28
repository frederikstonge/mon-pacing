npm install -g firebase-tools --force
dart pub global activate flutterfire_cli
# sudo gem install xcodeproj ## If kernel error : `require': cannot load such file -- xcodeproj (LoadError)
firebase login

flutterfire configure \
    --account frederik.stonge@gmail.com \
    --project mon-pacing \
    --ios-bundle-id=com.stongef.monpacing \
    --android-package-name=com.stongef.monpacing \ --yes