require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.16-darwin-x64.tar.gz"
    sha256 "81e52dcb2565d3d0fcfdcbc7cb1cd5f03feb994436648980e59daad92ca690ee"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.16-darwin-arm64.tar.gz"
      sha256 "9fd008382657343522cc6d5a044c83940f0b75645f1d2331422b8a9d7f44277d"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.16-linux-x64.tar.gz"
    sha256 "d33b032b0e26f2f9e99b8263dd78152486a38d27f935d90adfa371b3040240a4"
  end
  version "2024.8.16"
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
