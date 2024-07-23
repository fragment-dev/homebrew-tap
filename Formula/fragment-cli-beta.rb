require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5430.0.0-darwin-x64.tar.gz"
    sha256 "c025545a0e6ba2032d7d5ee7fbe9ee924a110c592deddd96db7dffdc47d5033d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5430.0.0-darwin-arm64.tar.gz"
      sha256 "6b53ec596f8b4f4d155795fcd648eae5be72b6cae2c807bbd2e2e9191d0f2774"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5430.0.0-linux-x64.tar.gz"
    sha256 "100dad1bfcfc5bcc4d726f2c9c5750d795042bc05ce155a2e513c5c27a1c879f"
  end
  version "5430.0.0"
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
