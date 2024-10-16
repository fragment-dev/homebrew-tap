require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5668.0.0-darwin-x64.tar.gz"
    sha256 "b577e093f91339f4c8c8c4278ea5ee6d121e4e4b711b09c3c45d64a0e835c092"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5668.0.0-darwin-arm64.tar.gz"
      sha256 "ef1abb5bb06e60669584ca7a01f4d9c8083796d35d4962e1745cdcc55f915058"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5668.0.0-linux-x64.tar.gz"
    sha256 "1b751d11739948fe592fc8ff973d858e360fe4836b1d8095bb31cf753e46505f"
  end
  version "5668.0.0"
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
