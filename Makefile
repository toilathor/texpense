.PHONE: clean
clean:
	flutter clean

.PHONE: get
get:
	flutter pub get

.PHONE: build-runner
build-runner:
	flutter packages pub run build_runner build --delete-conflicting-outputs

.PHONE: build-watch
build-watch:
	flutter packages pub run build_runner watch

.PHONE: gen-intl
gen-intl:
	flutter pub run intl_utils:generate

.PHONE: gen-splash
gen-splash:
	dart run flutter_native_splash:create flutter_native_splash-development.yaml

.PHONE: start-fire-emulator
start-fire-emulator:
	firebase emulators:start --only auth,firestore