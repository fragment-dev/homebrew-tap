require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.3-1-darwin-x64.tar.gz"
    sha256 "3ccff57cfc9bf2fddd2ef3c21632783450b365f1be4a73242eb06c79f80ab453"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.3-1-darwin-arm64.tar.gz"
      sha256 "1be6f02c3f6a1d44c3c34048cfcc3ad173b841015353ce8731834500dbbcd507"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.3-1-linux-x64.tar.gz"
    sha256 "a76a964a4fab290a7de5855b8c0e6b461637a2598e3e1a38e85d20879ab716f2"
  end
  version "2024.10.3-1"
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
