require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.16-1-darwin-x64.tar.gz"
    sha256 "1e5d2a94b3476dd2c8f2e19cd6b9339f2276095e25df7f130ccd7b671fb91bc0"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.16-1-darwin-arm64.tar.gz"
      sha256 "0152fd5e3ec89bc67f72b4053633945872008d5d60da949c2fa3dcd43473ef20"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.16-1-linux-x64.tar.gz"
    sha256 "d7196975f3f0ac865635f669137492cfafaafefb7d3c105eaf606ffb52f17d80"
  end
  version "2023.6.16-1"
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
