require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5103.0.0-darwin-x64.tar.gz"
    sha256 "5b83e567b8b825559f5bce9f6d07ca5c536d16c6d26032ffa2cc471d6cb8e63a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5103.0.0-darwin-arm64.tar.gz"
      sha256 "d8abfbd587a98b7e063c8cd0933b150c18cc32506864a8e4e9bd272bf6f45c49"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5103.0.0-linux-x64.tar.gz"
    sha256 "e58407ff54c8aed4556def74cb6907d1ef7e2e87fde68c537249d1d2a8502895"
  end
  version "5103.0.0"
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
