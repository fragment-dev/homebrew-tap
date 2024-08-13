require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5500.0.0-darwin-x64.tar.gz"
    sha256 "36ce78af97a088bce70ba91df9ab13a1322113ba2e810488b63fd74aa2857098"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5500.0.0-darwin-arm64.tar.gz"
      sha256 "f911f16e8069f60f9ca719c476329699cda8f7283609515a3c62bc997e1eb403"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5500.0.0-linux-x64.tar.gz"
    sha256 "ce184e19eecfe032327eba1e80b26eb59f5f79222b1b5cb5cec3711b025142e7"
  end
  version "5500.0.0"
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
