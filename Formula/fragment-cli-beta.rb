require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6045.0.0-darwin-x64.tar.gz"
    sha256 "4178c94ffd65651e6d426690ae36b10fe68174a72abd7a2c01d9dfe32ad7717a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6045.0.0-darwin-arm64.tar.gz"
      sha256 "1a07b1744b44807be1ee3a177ac9c20e6e654a62f25e576f2ef9628420edc19e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6045.0.0-linux-x64.tar.gz"
    sha256 "cf3bac6df34b6cb04458ec53018581ef368196576e8ad629d9be2050edd36ed6"
  end
  version "6045.0.0"
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
