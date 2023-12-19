require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4172.0.0-darwin-x64.tar.gz"
    sha256 "123f9c63b41e725a8a0d3fba7b349a3e6551ff0b2082f732253164f794ee15ca"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4172.0.0-darwin-arm64.tar.gz"
      sha256 "fc16072355e8ba6cf5f28d720d619c7ba22ec8ee49e4cf48bb138d11e31a700d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4172.0.0-linux-x64.tar.gz"
    sha256 "3772a99cbf53fe133a3824fa7a4b9c67dab6eb1edb941f2ad04fc44494d8b185"
  end
  version "4172.0.0"
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
