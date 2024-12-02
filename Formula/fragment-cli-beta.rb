require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5844.0.0-darwin-x64.tar.gz"
    sha256 "0fceb262a3fd60837e9c1d997d80b5325c2735e4c732ef462b9859240c20fd98"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5844.0.0-darwin-arm64.tar.gz"
      sha256 "494b526a86e60f9dafa223f2afbc85a34ed52c4f55512820b1e0ac796ee97012"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5844.0.0-linux-x64.tar.gz"
    sha256 "cd5ab3010fbf74ddc8c6e5e2ea7d65c9eb75ac14e72ba449fb90772c64345c95"
  end
  version "5844.0.0"
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
