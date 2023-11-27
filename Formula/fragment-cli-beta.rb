require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4048.0.0-darwin-x64.tar.gz"
    sha256 "bf2f9e45ef3452bbb6bc56bc63dbe9aa426e86d6927981b9d714a732ea0c5b9f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4048.0.0-darwin-arm64.tar.gz"
      sha256 "5745da1b1b9cd606ba526ea8122959f385750bf38460aa45cbb579a100f6a9b0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4048.0.0-linux-x64.tar.gz"
    sha256 "44e64b2fa8970f1dc3cfe71c5bc970d4955854aae1450c9d209885b5931a321b"
  end
  version "4048.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
