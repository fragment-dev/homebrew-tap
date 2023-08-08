require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.7-darwin-x64.tar.gz"
    sha256 "0556b32308723377212c08f57b9e349667b07fd80f00c24547a0f26bcfd17381"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.7-darwin-arm64.tar.gz"
      sha256 "23aba52656ab4bce06d3f72afb45799f77b424ddaaf38096ead30f1c43a5c8a4"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.7-linux-x64.tar.gz"
    sha256 "2bb0eb53ac45b380a1d5237735e30d01f17e985f06f7258a8f7865ddaddaa022"
  end
  version "2023.8.7"
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
