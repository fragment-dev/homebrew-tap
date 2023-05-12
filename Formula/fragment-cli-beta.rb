require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2652.0.0-darwin-x64.tar.gz"
    sha256 "e25d4815491f2b6b37c8e1985ea6c11a2baa7d9dea4c36aac0dee897903da323"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2652.0.0-darwin-arm64.tar.gz"
      sha256 "76ffc411fc196ff03daebc3d56cc80baf1a2ce12c99338eadd8f233eacc36a86"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2652.0.0-linux-x64.tar.gz"
    sha256 "5eb60d2d618015b1936c049ac220c93f53b43124025d9eca0dc72f47ad51d5c2"
  end
  version "2652.0.0"
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
