require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5513.0.0-darwin-x64.tar.gz"
    sha256 "bd5b94a5cdf0b6429830cbe499023fa02078c10e0891ed29a412563485d9e72a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5513.0.0-darwin-arm64.tar.gz"
      sha256 "1b97504bce973dc0ce2db74873759b2518fcc0cab213275d4d4e8f4c2c27bb5b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5513.0.0-linux-x64.tar.gz"
    sha256 "8ede560d01d3843902e779244e95a357786ce9b668ef6406e0d5a73c48e437a1"
  end
  version "5513.0.0"
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
