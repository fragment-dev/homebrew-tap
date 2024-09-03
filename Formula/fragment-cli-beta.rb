require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5560.0.0-darwin-x64.tar.gz"
    sha256 "39e649565ba45d884a0d2e2d86e4eca6c867e8cfb75cb244d930fe3c95afceb0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5560.0.0-darwin-arm64.tar.gz"
      sha256 "d844278662cdc508152478e833233ec8af3f2c4a358c68b8a2bf804f056d2d3d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5560.0.0-linux-x64.tar.gz"
    sha256 "a1fe75103d8bea8326cdd76f6cbf49a2024124c2cc088b5b80a22ba59bdcfe13"
  end
  version "5560.0.0"
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
