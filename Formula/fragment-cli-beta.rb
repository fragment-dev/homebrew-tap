require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2666.0.0-darwin-x64.tar.gz"
    sha256 "8c9e8a01093d5896d1848aabd5207d647017b24347139bac3199804e18ee96df"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2666.0.0-darwin-arm64.tar.gz"
      sha256 "a200fbf63dfc0c879d2c3cf27dd0bd91acf094e2ce0d5012d8d0c16af8bcf032"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2666.0.0-linux-x64.tar.gz"
    sha256 "8d14d8e83dd53f0444d2114969860a3d22f85a1ded3f4d770d4019976f1bd13a"
  end
  version "2666.0.0"
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
