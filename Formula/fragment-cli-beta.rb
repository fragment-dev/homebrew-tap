require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2651.0.0-darwin-x64.tar.gz"
    sha256 "2f9784219ada7330a38f8972e9017e9f0ca8731acee5752594f82ac9eb238b64"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2651.0.0-darwin-arm64.tar.gz"
      sha256 "9ddfacabe1f9150a2c5c195d591f237d32e3024c65985af1b052c6d2dd2ed8b2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2651.0.0-linux-x64.tar.gz"
    sha256 "b5c614c48d33f5c1f863cad1e00e69c3cb60edb75ef7811147b3e8e85a43a3f1"
  end
  version "2651.0.0"
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
