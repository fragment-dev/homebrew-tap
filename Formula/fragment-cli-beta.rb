require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4432.0.0-darwin-x64.tar.gz"
    sha256 "a1199333b991ce14545f897b7ddeddd1587de0499a99a968db8cb7667a25f3cb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4432.0.0-darwin-arm64.tar.gz"
      sha256 "5dd6efb115149c506eb463882279b385277dc1ddbdc34a18e97eed913dc12af1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4432.0.0-linux-x64.tar.gz"
    sha256 "edcba0b883554b274f9bdef02eb151fd817e327ba14667581745fb45540a5f7a"
  end
  version "4432.0.0"
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
