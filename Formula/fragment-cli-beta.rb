require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3697.0.0-darwin-x64.tar.gz"
    sha256 "7fefea82f77baeff289e350ba97ee17911e308f77516717dfdb362630aba2f63"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3697.0.0-darwin-arm64.tar.gz"
      sha256 "d075b464b97fd24b6436fb8971f96e8d636fdfdf216f30b148804f971aaec455"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3697.0.0-linux-x64.tar.gz"
    sha256 "8cd3c34f802b33175cb2e5fb499b7b1165c316d7dc0c3a6ab4b2655c8cadc664"
  end
  version "3697.0.0"
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
