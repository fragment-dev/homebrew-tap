require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3992.0.0-darwin-x64.tar.gz"
    sha256 "76dc5463da81eb109ad507500d53a8221afb42d2e6a3e657c0d206884ed1abb0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3992.0.0-darwin-arm64.tar.gz"
      sha256 "48ba4430fecf729e4f67cf3fd024ef7f93be659aaa790b9e700be7b61a6a5630"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3992.0.0-linux-x64.tar.gz"
    sha256 "c02a591fbab517b021791419c2bcf0f04460bd3fe83ba2f2db90b464938c2eed"
  end
  version "3992.0.0"
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
