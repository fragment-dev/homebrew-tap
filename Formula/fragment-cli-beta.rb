require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4372.0.0-darwin-x64.tar.gz"
    sha256 "53031dac7d2d49f912012b4e903e8e6570e0ca0a091e8c494e234daa1c2dfa82"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4372.0.0-darwin-arm64.tar.gz"
      sha256 "fe0df0be85c0a118a6fd5ca9c5bb7be286a2cb0c2df36f56fd9c5d9b754bde84"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4372.0.0-linux-x64.tar.gz"
    sha256 "4de26c9b3ee008264bf2fc449297a6d302a8c72039057448508a947d25276c1f"
  end
  version "4372.0.0"
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
