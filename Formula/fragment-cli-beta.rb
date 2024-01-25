require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4435.0.0-darwin-x64.tar.gz"
    sha256 "67a53c8e80633b358628092494acc457c92276273d2c04fa0dd37a2cac07e525"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4435.0.0-darwin-arm64.tar.gz"
      sha256 "937069bd36c35cb2b693e5bdf568890af7e4f2e4c5232c6e3e967fe283694c22"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4435.0.0-linux-x64.tar.gz"
    sha256 "27dc64a3d161b2d80900a801f5baa28a616927a92a86a7ea3dcce00434c5c875"
  end
  version "4435.0.0"
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
