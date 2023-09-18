require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3601.0.0-darwin-x64.tar.gz"
    sha256 "67d76b156d6933ed98d7ba1e1e6a3b4d414c02647bb43b18a923e1381ba7a243"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3601.0.0-darwin-arm64.tar.gz"
      sha256 "5e068922598a47aa21f9bd5429ad06466dde075e0159f03510fe8c702896fe74"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3601.0.0-linux-x64.tar.gz"
    sha256 "42fb493e6814958cdf9f8143aa943ac6e2c51923bbc02cb341769f77f9d2297a"
  end
  version "3601.0.0"
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
