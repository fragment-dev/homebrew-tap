require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.18-1-darwin-x64.tar.gz"
    sha256 "8d8e32487e6efe60ff9d343f9ce46be6d9973ad56c4bbd332dc94e881b1058b7"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.18-1-darwin-arm64.tar.gz"
      sha256 "d31c241633adf257e4c538f9ef156abec766c6658dfd06bd4e09232943291ee9"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.18-1-linux-x64.tar.gz"
    sha256 "c50a606f17b16a93d34836155fd0512627c74dfc23c3eafec5b175d9c1d99d66"
  end
  version "2024.10.18-1"
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
