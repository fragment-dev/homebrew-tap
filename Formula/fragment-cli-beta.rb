require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3564.0.0-darwin-x64.tar.gz"
    sha256 "1811aef43dc74559b9aa5e133836d94809edec8a037b03c1839c6c9855c9f7d5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3564.0.0-darwin-arm64.tar.gz"
      sha256 "f078a15608f9f8c453a15ecfb68cc03082a4715736756a8ef367bf9f9c937bda"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3564.0.0-linux-x64.tar.gz"
    sha256 "2696767b874429c2c516c98789cbf729aede62e517dc00f9b9514a4864171c61"
  end
  version "3564.0.0"
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
