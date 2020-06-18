cask 'flutter' do
    name "Flutter SDK"
    homepage "https://flutter.dev/"
    version :latest
    url "https://storage.googleapis.com/flutter_infra/releases/stable/macos/flutter_macos_1.17.3-stable.zip"
    sha256 "4506b3ab985f86a7a5b7a65ba2377b7407395e993c5094b9c843cbc4c798eb92"
    binary 'flutter/bin/flutter', target: "flutter"

    def postflight
        system "flutter upgrade --force"
        system "flutter doctor"
    end

    zap trash:  [
            '~/.flutter',
            '~/.devtools'
        ],
        rmdir:  [
            '~/.dart',
            '~/.dartServer',
            '~/.pub-cache'
        ]

    def caveats; <<~EOS
        Flutter SDK has been installed to #{staged_path}
        EOS
    end
end