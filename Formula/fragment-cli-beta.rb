require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4632.0.0-darwin-x64.tar.gz"
    sha256 "e9576b4e7da4d3404ee3c26c839b8d4034f7f241cdf0a8bc3cfa3435e4f6ba70"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4632.0.0-darwin-arm64.tar.gz"
      sha256 "586f11d7d6d8e9526ba009c420290e81fff52dcc1cc3665637bd1dab923c86d5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4632.0.0-linux-x64.tar.gz"
    sha256 "ecba201e75bf84e1d6a47e1b40a4a93e5f9b33d2b203982a9ba740153dc4d699"
  end
  version "4632.0.0"
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
