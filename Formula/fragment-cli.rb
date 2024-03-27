require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.27-darwin-x64.tar.gz"
    sha256 "f38b083555ee3ff1d2bf1bf6306ef38e5665c5684beea420e6e39396ee971478"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.27-darwin-arm64.tar.gz"
      sha256 "c022b5e08009fdde5eaac9f53631f884caffc1f38948ae8959c6ffd457762115"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.27-linux-x64.tar.gz"
    sha256 "7c33b66f66fb970b2d7ffeeafae89e3b810ef0b41558606b38b549c15866382b"
  end
  version "2024.3.27"
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
