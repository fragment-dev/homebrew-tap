require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.25-darwin-x64.tar.gz"
    sha256 "584dd605432123290f780886effb85bca42206331c9bdd500ae368983571f832"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.25-darwin-arm64.tar.gz"
      sha256 "9383394f1542d7cf73c66c0fc9ac31c5944b15c8782b8aecac162aefc3178e06"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.25-linux-x64.tar.gz"
    sha256 "5a31b5c3806ad3f4c7c6490369df8ce4f28c744ce65e62f6c345bd8c6ff4cff4"
  end
  version "2024.7.25"
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
