require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4338.0.0-darwin-x64.tar.gz"
    sha256 "82f1a3a4a8e982f944389ed9944fb6ee80fd74e0a7d9f22a1afabbd0cd2a36a0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4338.0.0-darwin-arm64.tar.gz"
      sha256 "a721099f9a0f704932c2d4465a0643b607cd27d486e8348749ba0b445ad1d39c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4338.0.0-linux-x64.tar.gz"
    sha256 "a80125ccdae98a023450b826f800fe9bd9d2b98275f1a1be5fb04db80af24aee"
  end
  version "4338.0.0"
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
