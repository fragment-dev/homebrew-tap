require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4915.0.0-darwin-x64.tar.gz"
    sha256 "321926cabebef370945118305037548e2691b6eb04708761a71209a13278abac"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4915.0.0-darwin-arm64.tar.gz"
      sha256 "6442b0bad026b78a579b7bb153a97b13e252911ec78b626de3d6ef64faf01d06"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4915.0.0-linux-x64.tar.gz"
    sha256 "fe5e98d827ffa51df2ab8c20d9f546c8c293852dcfa9bad69c1625c2d01b0aba"
  end
  version "4915.0.0"
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
