require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.18-darwin-x64.tar.gz"
    sha256 "835e7bd89e04a490a9db7db30450b3ffe330dd331d8587dd2da7f896f98ecced"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.18-darwin-arm64.tar.gz"
      sha256 "e5f9320a6d74ad1374c22021c100e1031d90f237981ae0ff06f99f74e63e799e"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.18-linux-x64.tar.gz"
    sha256 "52f41f3f654e79e0a9a5a753dd0c339cfc2ae2a7e1f014bb970d584c9b50eee1"
  end
  version "2023.4.18"
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
