require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.10-darwin-x64.tar.gz"
    sha256 "6e65141c5b905f10464481d7f9dccc433e36a0d4e8992aa4c2c17fb2f3ed3a31"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.10-darwin-arm64.tar.gz"
      sha256 "88a9b0d91d1edeb660ada2c2a211735f39e6d128b50746aa4620b56b049a2af7"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.10-linux-x64.tar.gz"
    sha256 "bd1a3d10a431ecfaede7d65eef7c8919efeeedd90905796ad0b3f354d77e0897"
  end
  version "2024.4.10"
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
