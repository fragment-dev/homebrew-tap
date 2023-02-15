require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2013.0.0-darwin-x64.tar.gz"
    sha256 "e69f988def5dc2eb11c5aef3688d74a19d859304d79dec15ee739044dbfa7665"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2013.0.0-darwin-arm64.tar.gz"
      sha256 "7577ccf934e86a5be46850ae44206887491218d169931eaf9b8a933094e386d8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2013.0.0-linux-x64.tar.gz"
    sha256 "72862d2ac0214d0a19b79e96308f0533b888a4a242ced14482afc7bcdf55b8a5"
  end
  version "2013.0.0"
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
