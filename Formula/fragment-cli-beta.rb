require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5296.0.0-darwin-x64.tar.gz"
    sha256 "4cae463b7d7e0a8419efc3bcf0f9ba945c48f4733117f76522f89b985c059f98"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5296.0.0-darwin-arm64.tar.gz"
      sha256 "05dd8c9c35cb1a0f5494881977020046063c33c217b46db66b87cc49a0faf1dc"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5296.0.0-linux-x64.tar.gz"
    sha256 "aaf5be9c8b621c7bcafedd62611ac0d29a8c07fec6bdf0c13e7989641efcdb13"
  end
  version "5296.0.0"
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
