require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5719.0.0-darwin-x64.tar.gz"
    sha256 "87e1be276d442bc4f868335d978a21dedf89cbf21e3a6cd2d2eecc0f61bbc926"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5719.0.0-darwin-arm64.tar.gz"
      sha256 "81b5d69f6b6dfb8dac710eaa6223901ca3e4b6bf63efc86ae9a08b590f9cbaf5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5719.0.0-linux-x64.tar.gz"
    sha256 "7677088002d57c36b5613a00170e6eb131c62108004089c63d9ea0439e4c6312"
  end
  version "5719.0.0"
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
