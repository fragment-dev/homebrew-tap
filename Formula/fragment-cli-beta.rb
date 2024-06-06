require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5220.0.0-darwin-x64.tar.gz"
    sha256 "29c5ac8985e2e874ff07b027f576c534c71d07dfc2dd2119f5acaccd0a37e899"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5220.0.0-darwin-arm64.tar.gz"
      sha256 "3eee1f91c115ee2989e16e4ff3cfd98789f460029edaf83795382d0dea860020"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5220.0.0-linux-x64.tar.gz"
    sha256 "73b109923a681dbdb405ed22cc1cc9caf9cc2d2196f04d441b398dcef35b89e7"
  end
  version "5220.0.0"
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
