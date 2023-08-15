require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.15-1-darwin-x64.tar.gz"
    sha256 "f84493a95a8a0b7e5d4f1120fd2d43398b715d2b018c6425bce609167a29b131"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.15-1-darwin-arm64.tar.gz"
      sha256 "295007d7190e5a0b6c619ec26a668ff9fb71335d285fd94b1bb18cf14eba73cb"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.15-1-linux-x64.tar.gz"
    sha256 "f8f071939896801e7e10b4b02e4aa474227c09977dfc00043c76de7247c09a5e"
  end
  version "2023.8.15-1"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
