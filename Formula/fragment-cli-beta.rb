require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2271.0.0-darwin-x64.tar.gz"
    sha256 "84940c5cdb17cd740503b4c304cc4dadb65d00ae1308af0811de77944e482161"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2271.0.0-darwin-arm64.tar.gz"
      sha256 "f135741cfcdacd0e0114d1a18630e6ceeb594effa13ef4741ee58c8db51be6da"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2271.0.0-linux-x64.tar.gz"
    sha256 "cb6f193a05b1d2b6a57cc81d63217eff842ecbc45f3c7cd7d436254cc5f12114"
  end
  version "2271.0.0"
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
