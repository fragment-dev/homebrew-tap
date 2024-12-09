require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.6-darwin-x64.tar.gz"
    sha256 "f6895d73cb4f385762368ee5f6993de222c946e54641815da7ecbcfdf810e21f"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.6-darwin-arm64.tar.gz"
      sha256 "3939d8225fe3ef54fa2550e6d3a791c0482600cc0536a61b05c817959e67b294"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.6-linux-x64.tar.gz"
    sha256 "e6809068d22258a60d8714c39fbe4e436ea7d1d15dbad05eb39ed5e0fe8bf954"
  end
  version "2024.12.6"
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
