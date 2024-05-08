require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.7-1-darwin-x64.tar.gz"
    sha256 "3a6590c99f61cb8d62cfaf01a7c6bb0abeb0e7ad7a7e409e86a4a46a2e269d4f"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.7-1-darwin-arm64.tar.gz"
      sha256 "3016c062be62f43c6d4543a5fa2202f4c3044509b4419b980b2e6cf82acb5e40"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.7-1-linux-x64.tar.gz"
    sha256 "3c12d60d55d853fb1e3367edb3a46c39597aca98e10a641ba8b4383f98f1cdd9"
  end
  version "2024.5.7-1"
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
