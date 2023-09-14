require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3561.0.0-darwin-x64.tar.gz"
    sha256 "ad87c104c5e2958cc3e93c4fe7a6892a4eebb4b41e83333bbf645e65996828d2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3561.0.0-darwin-arm64.tar.gz"
      sha256 "15ea4c6947e5fb629b46537fc1551d2f41f89750f1bfe6a37e54ccd3f8c49de8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3561.0.0-linux-x64.tar.gz"
    sha256 "707abf45d4a4ad7615f9cd3c382b4e1a7192fb36648a48ad050a9eae4a65cffc"
  end
  version "3561.0.0"
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
