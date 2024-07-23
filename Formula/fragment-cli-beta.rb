require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5428.0.0-darwin-x64.tar.gz"
    sha256 "0eacb88d29daac5f24c64c96db3ea8e6d926241408dcd67a38a81f1cea9f544e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5428.0.0-darwin-arm64.tar.gz"
      sha256 "3a06ebfc7b07199d50ea3fd1dbe41a7e026f00b28d1fa17b8c70e3ebf51f233c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5428.0.0-linux-x64.tar.gz"
    sha256 "a6faaa9fbb850a8778bb9252a6ae826133a62c2140a86b90ec00c129606b6957"
  end
  version "5428.0.0"
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
