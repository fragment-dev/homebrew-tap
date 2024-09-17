require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5602.0.0-darwin-x64.tar.gz"
    sha256 "1dece64e89919609596df7b8ddfc8b5afa22f1d1d95fa1473b0fa60c43072539"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5602.0.0-darwin-arm64.tar.gz"
      sha256 "7de465e0a572efc72ab54953437332972ebbc328491879dd73a8cd7f77c8ddf6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5602.0.0-linux-x64.tar.gz"
    sha256 "a6a5f2f3ba3b8b7b0727562d532c5c8bf467b45abfa4faa4651bc1e158a83680"
  end
  version "5602.0.0"
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
