require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4009.0.0-darwin-x64.tar.gz"
    sha256 "e3dec5bb42671bb993c6c9b17e1484821a69e82d3b52996b40d089af425f4f59"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4009.0.0-darwin-arm64.tar.gz"
      sha256 "7e880f6df7eb2e2738a00e932fa70d0569b3a96873f8e150989d1edd429f859f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4009.0.0-linux-x64.tar.gz"
    sha256 "ceb8e30c7e0541ba95a8303cc7658cc1b0f440bfc907b347e075024d12ea7326"
  end
  version "4009.0.0"
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
