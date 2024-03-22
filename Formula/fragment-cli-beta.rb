require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4804.0.0-darwin-x64.tar.gz"
    sha256 "6b7b3a68452c64826a7951d3cf5d07e78c0e527883f6fda1dd3c98f9f4e85b36"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4804.0.0-darwin-arm64.tar.gz"
      sha256 "998e1556d6cc6ddc9654845442f4c490ffa6430a25d6376056b704f95fd053b5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4804.0.0-linux-x64.tar.gz"
    sha256 "c61e97fbce2ee5b5c2fda97a5981d953d967aea5c8d7ea8aa7254e520724e4ec"
  end
  version "4804.0.0"
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
