require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5056.0.0-darwin-x64.tar.gz"
    sha256 "5c3073e26ed4f964bbc5133230cf150986beffb1152e85dda3885778d5fe723d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5056.0.0-darwin-arm64.tar.gz"
      sha256 "75f462ff8cbeb31f7419f85c32c31f4019001f09900a10650a7e6f7d8cf94d0b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5056.0.0-linux-x64.tar.gz"
    sha256 "d165648bf096025fe0d64d3753d4829cbb4a762eb92649eb386cf2ef12c14fe3"
  end
  version "5056.0.0"
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
