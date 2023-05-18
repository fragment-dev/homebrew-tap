require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.18-darwin-x64.tar.gz"
    sha256 "66469d38fc8357d21f6877625fd5439d86246b6782b59c2d8aedef25cd60ed2e"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.18-darwin-arm64.tar.gz"
      sha256 "1cb389ac0656f5d5c6662e3942b7d100eba572ea83cf298f6b8f340e5ff5856f"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.18-linux-x64.tar.gz"
    sha256 "be89a6591875b403825e9a89576b6ea15032cde37d93e48d511360fd9168cb60"
  end
  version "2023.5.18"
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
