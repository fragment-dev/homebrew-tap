require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.25-2-darwin-x64.tar.gz"
    sha256 "79e1f4b3b9f1ad1db1203772d0068ab24b228233ee0cc33fe4ce8020b0f40aa0"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.25-2-darwin-arm64.tar.gz"
      sha256 "70ce8da2109577f2f3788c37a1eea8c10bd9498d78f95f3607f4c3323ecc53c0"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.25-2-linux-x64.tar.gz"
    sha256 "d616834fb770bc6f3a55ad60390c93ea57b5de2df261aa3698063ca3c84870df"
  end
  version "2024.4.25-2"
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
