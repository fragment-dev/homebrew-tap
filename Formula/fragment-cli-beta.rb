require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5637.0.0-darwin-x64.tar.gz"
    sha256 "598c64e4d8c74e0e2a8d99f9f2e1f23b481ff0f1a186ca42750a4f7f1357a857"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5637.0.0-darwin-arm64.tar.gz"
      sha256 "4384eea148622ab430fdf54471fe3b5ae3397ee537fa12d3407beb660dac0c62"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5637.0.0-linux-x64.tar.gz"
    sha256 "fd5a0159d0adc80d8b3cf4ec3045647c0016775fb6f661a6e9d1674e362ef5c0"
  end
  version "5637.0.0"
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
