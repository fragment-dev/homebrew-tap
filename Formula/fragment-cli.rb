require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.3-1-darwin-x64.tar.gz"
    sha256 "3c7f64e22975feacca734e9920c3c904b29dd8859082c392bd3b3655cb202a1f"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.3-1-darwin-arm64.tar.gz"
      sha256 "abb106df80822506be8c0de86ccb64e64e423f7efcd03a1cbae53729c6cf3fe6"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.3-1-linux-x64.tar.gz"
    sha256 "6d5740842d2d67943037f1daa71b6bcfe391fb466ae6b35257d1fcd8b8938147"
  end
  version "2024.4.3-1"
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
