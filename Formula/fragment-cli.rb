require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.15-1-darwin-x64.tar.gz"
    sha256 "079f4580b81c273747ac010053d530f28891168482e8af2fc80853cbafe0ebbc"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.15-1-darwin-arm64.tar.gz"
      sha256 "a5dfdbfc40c44aaf9c171e7782de45c3580d922699ebdb3a2f6ace32a5640552"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.15-1-linux-x64.tar.gz"
    sha256 "6442f40ceebcd0f8f0d7a50c4b7c08fa40c2774ef86e1dfd45245dc8362f83ca"
  end
  version "2024.5.15-1"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
