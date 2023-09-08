require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3513.0.0-darwin-x64.tar.gz"
    sha256 "00957e66c193ae3334e1111e54f15d7bb2d45e65c614c53680a16720b3b00faf"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3513.0.0-darwin-arm64.tar.gz"
      sha256 "807a4150f4222fc9e7a02f5069e06171aa7f71debf3ff30ebd7b94c5a5694896"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3513.0.0-linux-x64.tar.gz"
    sha256 "b330fad4e85d2cd7124466435c34b70cdf34df089ea7cc7c641503ee8a8bf030"
  end
  version "3513.0.0"
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
