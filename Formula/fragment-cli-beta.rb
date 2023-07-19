require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3122.0.0-darwin-x64.tar.gz"
    sha256 "33a9fa2a79ccb86fe9f0747370b143236227186235840aa9dfc0f7f315ad3814"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3122.0.0-darwin-arm64.tar.gz"
      sha256 "86446ff6b9423b730110347ecf576a5865d229cb2913b633ad6f270a8dc6c80d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3122.0.0-linux-x64.tar.gz"
    sha256 "7786bb00d52b56d342a9a57ba625a528b89062500b4aaeb378409ecad773e3d4"
  end
  version "3122.0.0"
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
