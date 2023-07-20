require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3141.0.0-darwin-x64.tar.gz"
    sha256 "72a96e7931d11850067774d71f20373e6025671f575a8e09523509934576c073"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3141.0.0-darwin-arm64.tar.gz"
      sha256 "771e0f20fc653dbe9703106dfafb7f216a4b58349d613a67f76e7c1664d6901e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3141.0.0-linux-x64.tar.gz"
    sha256 "d463e8c29ad1126be506e2daf6aa41b72104a00e6cb3799e084ac3c0a327f2f0"
  end
  version "3141.0.0"
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
