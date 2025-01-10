require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6063.0.0-darwin-x64.tar.gz"
    sha256 "b20a63534c127e99769de2f04e59be65b1832e7ed74b3e3791d034e30c160057"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6063.0.0-darwin-arm64.tar.gz"
      sha256 "b7b7b55ee3d3cbb9aeb72912a1130aedf91fc2a3f85df347f3b8ffb4ce0eeb13"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6063.0.0-linux-x64.tar.gz"
    sha256 "5d8c13b51b37cb231a00a9bfd8294e96c5c0063c3db1465b0a181822dc661a27"
  end
  version "6063.0.0"
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
