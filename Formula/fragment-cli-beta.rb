require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4599.0.0-darwin-x64.tar.gz"
    sha256 "7e8789403431562890cf9d0cfb27e6e721ca1d74452bef2ddc6cac8769a2a951"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4599.0.0-darwin-arm64.tar.gz"
      sha256 "9efe0678674c93a5cfc427d8d92c7349708436765485c4b2f5889e7d85a5bd39"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4599.0.0-linux-x64.tar.gz"
    sha256 "bd1034b966c0f64a6762cc4c203cc409d3157fbb39331e1cd343ffdce0587809"
  end
  version "4599.0.0"
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
