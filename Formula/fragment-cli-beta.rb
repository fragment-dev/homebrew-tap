require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2487.0.0-darwin-x64.tar.gz"
    sha256 "a5fa4d1e6c022a4c6a88c84718b583813151bbb268c666129ad1299a03714bec"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2487.0.0-darwin-arm64.tar.gz"
      sha256 "f51242d5eaab8f556ed573aaae61816f5cb7a93129746ce6afc9085c69da58c5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2487.0.0-linux-x64.tar.gz"
    sha256 "54b46f99967c04584abb0ee7308ecf4be2b5710a560a8e0098c5b8fd4cfe0d00"
  end
  version "2487.0.0"
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
