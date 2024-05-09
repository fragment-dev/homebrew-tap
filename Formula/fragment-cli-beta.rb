require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5019.0.0-darwin-x64.tar.gz"
    sha256 "85b93ff096d7255f7dc53202deadd4120fc539ecb1d931922adc1f5f3954d194"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5019.0.0-darwin-arm64.tar.gz"
      sha256 "981f54f19c8598e1eaf5001d53c9322d41056fc87bf2c0c2efab1f12d58e46fe"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5019.0.0-linux-x64.tar.gz"
    sha256 "40872038826056fae6e60ccf329ea1105cb0a6ab699a259e139f02a580507312"
  end
  version "5019.0.0"
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
