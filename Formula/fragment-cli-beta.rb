require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4796.0.0-darwin-x64.tar.gz"
    sha256 "1aecac175108f5195d71e641fbb3e5a0b137e415da72755dc93cfd34e1e64c51"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4796.0.0-darwin-arm64.tar.gz"
      sha256 "e9b20d90b59e26973bf4a4a515344b57a3c89642436531193959e0abbefa385b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4796.0.0-linux-x64.tar.gz"
    sha256 "16238b0bace73667b3b32e8c812557128963fb6933fc924aa9c8a3f7b63abd96"
  end
  version "4796.0.0"
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
