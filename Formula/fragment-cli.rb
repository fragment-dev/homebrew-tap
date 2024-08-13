require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.12-1-darwin-x64.tar.gz"
    sha256 "6a0b11b84d56282f6cd3606b1aea564bb3fb4710b7792da7a5379d3ce57d69bb"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.12-1-darwin-arm64.tar.gz"
      sha256 "77872e6c8f02c8cfa2fc25c89ffaf5092ca40205960868848d190486ca051119"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.12-1-linux-x64.tar.gz"
    sha256 "6daebbbc68486c577d128fa65b5256c0021a838f47ac8d6d9b5aae8678f1f2a1"
  end
  version "2024.8.12-1"
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
