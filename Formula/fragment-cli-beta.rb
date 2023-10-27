require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3916.0.0-darwin-x64.tar.gz"
    sha256 "ac6298d611043e85ba5e9eff6e7d6d2bfcbfeb4564a2918bb236f15def10032b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3916.0.0-darwin-arm64.tar.gz"
      sha256 "81dce649c10b03ccddc2a74972f52e6f4bb207ea5d41e0425d5cc114624939ce"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3916.0.0-linux-x64.tar.gz"
    sha256 "500a205088ed1a793e27b01d7540d2e7354ed28d476b87e5217c22f8c3e80a38"
  end
  version "3916.0.0"
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
