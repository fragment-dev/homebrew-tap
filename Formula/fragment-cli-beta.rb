require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3377.0.0-darwin-x64.tar.gz"
    sha256 "ad9ff616656fb0a3346d2f4275a9acf673dc4b95a564e8ad8ae71a8f1793edc7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3377.0.0-darwin-arm64.tar.gz"
      sha256 "afedd4a5a91b7ce1211ce72728f8371efcf85b74c37097bf339c86c85c1aaba5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3377.0.0-linux-x64.tar.gz"
    sha256 "3a261432295784d4dd5f126bab8f204dc4e8762fe05ff92f7e9b1925f5f3be71"
  end
  version "3377.0.0"
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
