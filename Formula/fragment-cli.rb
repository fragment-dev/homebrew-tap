require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.9-darwin-x64.tar.gz"
    sha256 "daef71e5e2138dbf7aecd1a8f2dfb8a16062c94b0c622c3f1bcb9a17a1a8e683"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.9-darwin-arm64.tar.gz"
      sha256 "25afb9c8be6ae275437b8beb083b184cb655888f9609e0ea7d86afa5ccf25d7b"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.9-linux-x64.tar.gz"
    sha256 "48b4b4a71c4cc9daccf7bb97e8ce5c19226d96b01921af1989eb76435fba5aff"
  end
  version "2024.9.9"
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
