require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5605.0.0-darwin-x64.tar.gz"
    sha256 "0d1d9a786471b0ccde5aa5787c3bcefe38efbdd8e528a370ca61bc3decf8c827"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5605.0.0-darwin-arm64.tar.gz"
      sha256 "7ae7457e96d5f795e2ba5671cc95d6277ff91836ec112d6cf8f97c928a525428"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5605.0.0-linux-x64.tar.gz"
    sha256 "2af1be0ee3331ba019de7d532e17a2d0d13f1e446e201a63f9042b737cc370c4"
  end
  version "5605.0.0"
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
