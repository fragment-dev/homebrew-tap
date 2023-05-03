require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2572.0.0-darwin-x64.tar.gz"
    sha256 "1b7d5d118e7217c7fd68fa2dd8940a4b651b473875e71892e2850fc4a4ace3a3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2572.0.0-darwin-arm64.tar.gz"
      sha256 "0e4f03dfd36f0b00ee42b4a05d5bbc540d0b70fac5753194d8cf91981dd3d4de"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2572.0.0-linux-x64.tar.gz"
    sha256 "fa1417db7236ef6076a7dfb55b9979f097ff546416f84bde37c07b8042365e05"
  end
  version "2572.0.0"
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
