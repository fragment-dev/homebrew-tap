require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3775.0.0-darwin-x64.tar.gz"
    sha256 "7ea258d2d9577640ae1e718803126b037625c57b9da3d440980a63d9bdd8c5dd"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3775.0.0-darwin-arm64.tar.gz"
      sha256 "a7f9ff4242321a45d07ad1d58caeb901fd5ead2381a68ed61aeca800dcce24e5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3775.0.0-linux-x64.tar.gz"
    sha256 "c1dad759edc0aa2145ac5e523df679919ce72a0ced5625d1ef4913d37bb50bcf"
  end
  version "3775.0.0"
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
