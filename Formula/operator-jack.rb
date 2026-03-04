class OperatorJack < Formula
  desc "Local-first CLI for deterministic macOS automation"
  homepage "https://github.com/rajkum2/operator-jack"
  version "0.4.0"
  url "https://github.com/rajkum2/operator-jack/releases/download/v0.4.0/operator-jack-v0.4.0-macos-universal.tar.gz"
  sha256 "67619e639f57f237f985d8940a8d331772b3d7cb1bd7c7fcb45226446c6c2598"
  license "MIT"

  depends_on :macos

  def install
    bin.install "operator-jack"
    bin.install "operator-macos-helper"
  end

  def caveats
    <<~EOS
      To use UI automation features, grant Accessibility permission to your
      terminal application:

        System Settings > Privacy & Security > Accessibility
        Add: #{which_terminal}

      Then restart your terminal and run:

        operator-jack doctor
    EOS
  end

  def which_terminal
    case ENV["TERM_PROGRAM"]
    when "iTerm.app" then "iTerm2"
    when "Apple_Terminal" then "Terminal.app"
    when "vscode" then "Visual Studio Code"
    else "your terminal app (Terminal.app, iTerm2, etc.)"
    end
  end

  test do
    assert_match "operator-jack", shell_output("#{bin}/operator-jack --version")
  end
end
