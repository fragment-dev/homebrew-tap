require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3022.0.0-darwin-x64.tar.gz"
    sha256 "2eda4b6683817f94a565640fba7298d17f658464a00daa357d3e1b13e807eb60"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3022.0.0-darwin-arm64.tar.gz"
      sha256 "634cb933cfa7f3ad294a48982d36269b2d43d79d9174ae40d35c63b3e51b5421"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3022.0.0-linux-x64.tar.gz"
    sha256 "b27eef15b4447d69ca3b1ab74447a78428679df3ebeb69d456522a94a2b049e0"
  end
  version "3022.0.0"
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
