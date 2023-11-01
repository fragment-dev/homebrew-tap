require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3955.999.0-darwin-x64.tar.gz"
    sha256 "fbfd0af00f3045f5c48a0cec60e0e53f625c60afeab9320a95b931980b01893d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3955.999.0-darwin-arm64.tar.gz"
      sha256 "b1e090779b4dfab9e7c261ca774583f39e0209b2296fcebacf5bb471e2ee32b3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3955.999.0-linux-x64.tar.gz"
    sha256 "86269f1defd40e650f8118899fc2c6bba5915332e9568f92df59def48c02a8f4"
  end
  version "3955.999.0"
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
