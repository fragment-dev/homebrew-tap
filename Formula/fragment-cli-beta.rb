require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3212.0.0-darwin-x64.tar.gz"
    sha256 "7e568c65a9dd062909a559c58227fdc43b7ffcbfdd9af0ce847b1f31b6c02628"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3212.0.0-darwin-arm64.tar.gz"
      sha256 "cd2ed8a9542d2c89afc97e3b5d97b90439bbe9ef7363c8033e925a6b5020f832"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3212.0.0-linux-x64.tar.gz"
    sha256 "9190edb6906faa1a808bbbe57e5094f60215a6c1d7869a339100015e77f5b2e7"
  end
  version "3212.0.0"
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
