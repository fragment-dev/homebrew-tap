require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6088.0.0-darwin-x64.tar.gz"
    sha256 "f46202e69ec9bdbe23fb003ffd768a1691f9974891150663e92ee658ac430fc9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6088.0.0-darwin-arm64.tar.gz"
      sha256 "8ec8c0b727df4ff3b5b939c6fcecd8fa4e062e7d6e0a9a0f4de6f51574dde237"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6088.0.0-linux-x64.tar.gz"
    sha256 "a5922ea125483cfadad37825b7000790d1db79606269fc110133944931c7975e"
  end
  version "6088.0.0"
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
