#!/usr/bin/env bash
PS1="[flutter-env]$PS1"
ANDROID_HOME="$HOME/Android/Sdk"
PATH="$PATH:/opt/android-studio/bin:$ANDROID_HOME/cmdline-tools/latest/bin"
PATH="$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator"
PATH="$PATH:/opt/flutter/bin"
ANDROID_EMULATOR_WAIT_TIME_BEFORE_KILL=1
alias ghr="cd ~/actions-runner && ./run.sh"
alias frd="flutter run --flavor dev"
alias frp="flutter run --flavor prod"
alias emu='emulator @API36'
alias fbd_adhoc="flutter build apk --release --target-platform android-arm64 --flavor dev && localsend_app ./build/app/outputs/flutter-apk/app-dev-release.apk"
