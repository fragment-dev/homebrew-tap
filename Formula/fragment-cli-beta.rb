require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3526.0.0-darwin-x64.tar.gz"
    sha256 "77dd527901f0be6f8b7bf5b6f52576c547af132a6f01efc57ee0f92f050b829a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3526.0.0-darwin-arm64.tar.gz"
      sha256 "e4d63b0e6dad6a7cbe5257291b204ed1484dd96519acdc1e675cec2c8c74b153"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3526.0.0-linux-x64.tar.gz"
    sha256 "73188d391ddf64a7f583ebdc33c1237c97cdab17be4598618fb3c41369c7839c"
  end
  version "3526.0.0"
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
