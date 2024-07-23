require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5429.0.0-darwin-x64.tar.gz"
    sha256 "17009fad3b813c76b9027b5764cf994b4b2cf364325cb26c9d6da656a135c060"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5429.0.0-darwin-arm64.tar.gz"
      sha256 "8d9547af92fd9d2ed883732c548bb4a32e15ef76d4dbff18f5c20ff636363709"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5429.0.0-linux-x64.tar.gz"
    sha256 "8c84565fdfb68de6033e4e09c684654a487964077c2f6d7f43b72700f41705cd"
  end
  version "5429.0.0"
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
