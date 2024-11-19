require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5797.0.0-darwin-x64.tar.gz"
    sha256 "a8176d258ec7461a32205f910c2f3fc9a8ee68970000780e2040b913d2d8be04"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5797.0.0-darwin-arm64.tar.gz"
      sha256 "2d349f71bbe102c06d7ea680b83632306951aae07d5858074831b974e75a49ed"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5797.0.0-linux-x64.tar.gz"
    sha256 "e381483ca165b6e00a93821b548d8779959f7daa6ea5abe21811ba1fa36caf43"
  end
  version "5797.0.0"
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
