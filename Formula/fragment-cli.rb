require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2026.1.16-darwin-x64.tar.gz"
    sha256 "241fb6d66b7c1cf714935ff663e11139944a43079617db661b74379b497c5440"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2026.1.16-darwin-arm64.tar.gz"
      sha256 "2b1c8b2138aba5f2565bffc311c28ec95ca9afaafb5dee46af49d20d1242489a"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2026.1.16-linux-x64.tar.gz"
    sha256 "15fc10fbd95694a45b1dc7daf3e53062bc6c33eb8bd64db17e2bf2495a5a0ec5"
  end
  version "2026.1.16"
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
