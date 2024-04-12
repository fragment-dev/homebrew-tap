require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4884.0.0-darwin-x64.tar.gz"
    sha256 "4bab7db8fd105f4a9c755bb0a247cfc04c1157fbe146b4bad052bb478189a072"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4884.0.0-darwin-arm64.tar.gz"
      sha256 "8a7088db58b80341d76bcfa1cb6bdd0f5318edf7d5a56a73c7601e40bc3ca8b5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4884.0.0-linux-x64.tar.gz"
    sha256 "8413aa7c1b5e44b8b67dec17e275a3e209d7b8d678eedfacd1027f23f4621e34"
  end
  version "4884.0.0"
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
