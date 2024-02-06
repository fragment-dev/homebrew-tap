require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4509.0.0-darwin-x64.tar.gz"
    sha256 "963103e823d5cba3773e03a4b4254f4ec4dd6fca633425c1dc61722f0d8ca013"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4509.0.0-darwin-arm64.tar.gz"
      sha256 "a3bd8c95a23f2f7ec07ac4e058acfbb3d2d9ecf16602ee048df5629e46095fae"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4509.0.0-linux-x64.tar.gz"
    sha256 "3560e4b9f30531f6450780ef618ec6699c4df566d8b3e4282f923e7b9327f3e0"
  end
  version "4509.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
