require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.7-darwin-x64.tar.gz"
    sha256 "bfa3ec6330d6b69a21ac70f4d7b641215958eb6b8b90e4905fe9fc353de49c1e"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.7-darwin-arm64.tar.gz"
      sha256 "a967e4f3bd4dc27321c0773e9681ac2a92cf3c44a72a78734a9043e06c8b8d2d"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.7-linux-x64.tar.gz"
    sha256 "12d1f20792cb472136d80006e887d6bde71f637e6c19b6213158ff162be35e4e"
  end
  version "2024.3.7"
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
