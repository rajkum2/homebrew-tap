class OperatorJack < Formula
    desc "Deterministic computer automation CLI (Rust + macOS helper)"
    homepage "https://github.com/rajkum2/operator-jack"
    version "0.4.0"
    url "https://github.com/rajkum2/operator-jack/releases/download/v0.4.0/REPLACE_ME.tar.gz"
    sha256 "REPLACE_ME"
  
    depends_on :macos
  
    def install
      bin.install "operator-jack"
      bin.install "operator-macos-helper"
    end
  
    def caveats
      <<~EOS
        Thanks for installing Operator Jack!
  
        Next:
          operator-jack doctor
  
        macOS permissions required for UI automation:
          System Settings → Privacy & Security → Accessibility → enable:
            - operator-macos-helper
  
        If typing/clicks are blocked:
          System Settings → Privacy & Security → Input Monitoring → enable:
            - operator-macos-helper
  
        Logs:
          operator-jack logs
      EOS
    end
  
    test do
      system "#{bin}/operator-jack", "--version"
    end
  end