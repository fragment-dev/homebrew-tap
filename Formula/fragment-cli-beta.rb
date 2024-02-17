require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4582.0.0-darwin-x64.tar.gz"
    sha256 "0a8e340e078406424ee2bad39e44df53aaa46053f27e82fffd647654936fb7f6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4582.0.0-darwin-arm64.tar.gz"
      sha256 "79163e44dd2a3f506fba46cc5b2a7ff6ad2a33e52afd3b7190023bdcbbff960f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4582.0.0-linux-x64.tar.gz"
    sha256 "ec7ee12382a6a44064a63a28cd3266070e9e5a75fc80bc6466ff3a31c60f2a3f"
  end
  version "4582.0.0"
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
