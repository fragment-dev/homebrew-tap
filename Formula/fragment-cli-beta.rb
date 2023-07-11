require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3036.0.0-darwin-x64.tar.gz"
    sha256 "da3349df260f9eb369ca107a81cbed20f8913a633ec7916079bd3c455b9a6f7e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3036.0.0-darwin-arm64.tar.gz"
      sha256 "9b9d94fb07b97c4946db6213b84d26a14396e063508554b8f432d6d655a0cb7e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3036.0.0-linux-x64.tar.gz"
    sha256 "363bbe6b0a14b6efeeeb43b0b28bbb634bb39110b3c4ea3612a21ad2559bafec"
  end
  version "3036.0.0"
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
