require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.2-1-darwin-x64.tar.gz"
    sha256 "41eb7df676e9ff28e169f37d2c6b8fa02f7dce73ed3fc121ec3a114598adb038"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.2-1-darwin-arm64.tar.gz"
      sha256 "1d1a62051513f8b3dfa76f14d6ad9cdd2530d5930a635c52fd3b3e767109804d"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.2-1-linux-x64.tar.gz"
    sha256 "920b680abaa1ab66e825e3884e15e1fbf3161d1eb4349f0a993729aea3bba122"
  end
  version "2024.8.2-1"
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
