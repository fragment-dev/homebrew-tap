require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3598.0.0-darwin-x64.tar.gz"
    sha256 "823d777a79db80c7e93c888adae4c4e92d56967df83514eb2d90713af3f38cf4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3598.0.0-darwin-arm64.tar.gz"
      sha256 "b1fbfa646f7a22c141acbc053be56d65295dddf230994e5f28bc863cbb594cf5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3598.0.0-linux-x64.tar.gz"
    sha256 "1c577fabdb472e3de3e13cfc27d8ffe90efd492f7d3a8ee8c12a6e816476ad68"
  end
  version "3598.0.0"
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
