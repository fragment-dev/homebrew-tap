require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5555.0.0-darwin-x64.tar.gz"
    sha256 "c04329538cc64c5eb4804acefe8be722a00a1b2c2d1c59230dbf09d0a53d2345"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5555.0.0-darwin-arm64.tar.gz"
      sha256 "1ddc47857ea0b36f5132b2f9580f8823817f72f6806d10acc5cb01a8c59c1a27"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5555.0.0-linux-x64.tar.gz"
    sha256 "0baf5f04cecbf9426b3933ceff7027a0b51938b50f16ee88d06954e53d110dd0"
  end
  version "5555.0.0"
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
