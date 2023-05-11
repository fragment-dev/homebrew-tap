require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2635.0.0-darwin-x64.tar.gz"
    sha256 "514f2de9857b9948546b8e47504558b04975af386f5627b54be1708e018be40b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2635.0.0-darwin-arm64.tar.gz"
      sha256 "1a99a2dc2970b2be71a3a0289c109f92954a21019e9954d46f9657f126d3f39b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2635.0.0-linux-x64.tar.gz"
    sha256 "4152fd1ed6957209df8275d18f3cfca0987e3028e7f3a72f2cad18f396b71031"
  end
  version "2635.0.0"
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
