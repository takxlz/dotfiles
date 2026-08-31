# macOS システム設定。現在の Mac の状態を defaults から読み取って起こしたもの。
# 反映は `darwin-rebuild switch --flake ~/dev/github.com/takxlz/dotfiles/nix#takxlz`
{
  system.stateVersion = 6;
  system.primaryUser = "takxlz";

  # Nix 本体は Determinate Nix が管理しているため、nix-darwin には触らせない。
  # これを外すと /etc/nix/nix.conf と nix-daemon の管理が二重になり衝突する。
  nix.enable = false;

  users.users.takxlz.home = "/Users/takxlz";

  system.defaults = {
    NSGlobalDomain = {
      # キーリピートを最速に（既定は InitialKeyRepeat=68, KeyRepeat=6）
      InitialKeyRepeat = 15;
      KeyRepeat = 2;
      # 長押しでアクセント入力させない（vim 系エディタで必須）
      ApplePressAndHoldEnabled = false;
      # 拡張子を常に表示
      AppleShowAllExtensions = true;
      AppleTemperatureUnit = "Celsius";
      # 日本語入力の邪魔になる自動変換を無効化
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;
      NSAutomaticDashSubstitutionEnabled = true;
      NSAutomaticQuoteSubstitutionEnabled = true;
      # F1〜F12 を標準のファンクションキーとして使う
      "com.apple.keyboard.fnState" = true;
      "com.apple.springing.enabled" = true;
      # ナチュラルスクロール
      "com.apple.swipescrolldirection" = true;
      "com.apple.trackpad.scaling" = 3.0;
      AppleKeyboardUIMode = 0;
    };

    dock = {
      autohide = true;
      orientation = "left";
      tilesize = 74;
      magnification = true;
      largesize = 58;
      # ホットコーナー: 左上=Mission Control、右下=デスクトップを表示
      wvous-tl-corner = 1;
      wvous-br-corner = 14;
    };

    finder = {
      # カラム表示を既定に
      FXPreferredViewStyle = "clmv";
      ShowPathbar = true;
      ShowStatusBar = true;
      _FXShowPosixPathInTitle = true;
      ShowExternalHardDrivesOnDesktop = true;
      ShowHardDrivesOnDesktop = true;
      ShowMountedServersOnDesktop = true;
      ShowRemovableMediaOnDesktop = true;
    };

    trackpad = {
      Clicking = true;               # タップでクリック
      Dragging = false;
      TrackpadRightClick = true;
      TrackpadThreeFingerDrag = false;
      TrackpadThreeFingerTapGesture = 0;
      FirstClickThreshold = 1;
      SecondClickThreshold = 1;
    };

    menuExtraClock = {
      ShowAMPM = true;
      ShowDate = 0;
      ShowDayOfWeek = true;
    };

    WindowManager = {
      GloballyEnabled = false;       # ステージマネージャは無効
      AutoHide = false;
      HideDesktop = true;
      AppWindowGroupingBehavior = true;
    };

    # com.apple.universalaccess は SIP に保護されており defaults から書けない。
    # 設定しようとすると activation が "Could not write domain" で失敗する。
    # （closeViewScrollWheelToggle = false は既定値なので指定する必要も無い）
    spaces.spans-displays = false;
  };

  # Homebrew を宣言的に管理する場合はここで有効化する。
  # cleanup は既定の "none"（宣言に無いものを消さない）から変えないこと。
  # homebrew = {
  #   enable = true;
  #   taps = [ "qmk/qmk" "osx-cross/avr" "osx-cross/arm" ];
  #   brews = [ ... ];
  #   casks = [ ... ];
  # };
}
