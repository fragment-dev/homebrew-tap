require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5254.0.0-darwin-x64.tar.gz"
    sha256 "66ac7537e7a74bff1dcc62e915f30275e7ba6337b4830ea49feea6fb7f4df589"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5254.0.0-darwin-arm64.tar.gz"
      sha256 "13f5fb7c11064109d89dfe92360341aa1acd9aaede47195b1c24d65a8f41a527"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5254.0.0-linux-x64.tar.gz"
    sha256 "3c57af65cf35c1016db0a74d16f1981cf7de22b9cc52b7f62c314f279af6f068"
  end
  version "5254.0.0"
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
