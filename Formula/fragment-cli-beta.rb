require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5739.0.0-darwin-x64.tar.gz"
    sha256 "6d7b30793feb01ec56b490feb624cefff8978f35470c39a444ae95699d129692"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5739.0.0-darwin-arm64.tar.gz"
      sha256 "61d3f47b32800aad1aef3a6c6e95b64680b73658d4405a90b1ce72b2079aca6e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5739.0.0-linux-x64.tar.gz"
    sha256 "1cea56a5eb76d3331d4d158d7369f9435a48f06ba742c79829264610647a0f79"
  end
  version "5739.0.0"
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
