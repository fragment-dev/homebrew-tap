require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.21-darwin-x64.tar.gz"
    sha256 "2c2f4b8af7e22e9aeb53a87dd7479a435b74dc5fa54c97df81be390c3bd057ab"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.21-darwin-arm64.tar.gz"
      sha256 "24fefeab41c983b37043990eea09da43db3dd57ccd3b634bf0a9ac7187e2d82f"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.21-linux-x64.tar.gz"
    sha256 "924c8d7baea27a12745c3b73ffa2106af4e55fabba70614e833c00424c524fd8"
  end
  version "2025.1.21"
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
