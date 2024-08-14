require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.14-2-darwin-x64.tar.gz"
    sha256 "9838c1649002c9957d55802075eae2d98cfb8cc5ed55157f8df3db51517359d6"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.14-2-darwin-arm64.tar.gz"
      sha256 "8e1853c8f1305b8e4e7ae9824ae0b503dcc960b81508395f577f7a8176bca98c"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.14-2-linux-x64.tar.gz"
    sha256 "8e7dfc020f1bd710d3a65e0359a7a6af22532a447505ecd5b74cb383813962e7"
  end
  version "2024.8.14-2"
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
