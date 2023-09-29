require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3719.0.0-darwin-x64.tar.gz"
    sha256 "a25492e58c3d2c18b08fec9647c4cdc30a4b06981392609f1ab6e4a7244fa6d7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3719.0.0-darwin-arm64.tar.gz"
      sha256 "adf0411929446e03ab7298ad5f51ecb7bb220b1f5c6164fd3c4fe95ef55159af"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3719.0.0-linux-x64.tar.gz"
    sha256 "46f325810cf75f89bbbfaaec7bd70da4d51d21a4ae4b37e53a55d0f31db03ba0"
  end
  version "3719.0.0"
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
