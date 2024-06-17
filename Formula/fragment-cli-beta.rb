require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5289.0.0-darwin-x64.tar.gz"
    sha256 "bca083443b231627dde3e51affd3d99557e13df30c40e3cd0f7c7445b4874b2a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5289.0.0-darwin-arm64.tar.gz"
      sha256 "f845a0cd446cf0068e3593e1226e0c58e77cebf2339d31c3d46f9d06bbcb0d88"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5289.0.0-linux-x64.tar.gz"
    sha256 "132c231fd5f1be04202cf4eacd5bd2df4e134080fbaa0686d6ca6d8f3da8a196"
  end
  version "5289.0.0"
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
