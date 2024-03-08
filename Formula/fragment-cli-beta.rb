require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4739.0.0-darwin-x64.tar.gz"
    sha256 "c185bab0ea1c284c9895d74e4285154bfcfe033898d867dd9d8672117ce52647"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4739.0.0-darwin-arm64.tar.gz"
      sha256 "5919daf5d7a3da2b9edf4442cea116e940788c1f23fb0cd05fc3d3ecc9f5410e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4739.0.0-linux-x64.tar.gz"
    sha256 "d99e2e8e59a469c92b6e0735d80df44e351718e4a0651c43b26fe9ea468f744a"
  end
  version "4739.0.0"
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
