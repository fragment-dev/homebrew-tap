require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4752.0.0-darwin-x64.tar.gz"
    sha256 "539398705e20f5b741d72613c778fe4cad989d43e8a56c34ace04bcc0863e6f1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4752.0.0-darwin-arm64.tar.gz"
      sha256 "280b8414532791465c90eb144f23d539b4937f2bbaa201fb1402e2df888edc56"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4752.0.0-linux-x64.tar.gz"
    sha256 "b2c86637c91390c8e7b362981cedfa01e29ccdb62d2a9d0a59dc631a1562cf71"
  end
  version "4752.0.0"
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
