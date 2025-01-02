require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6026.0.0-darwin-x64.tar.gz"
    sha256 "1253d2b8db964339315fb8614d8b382893f1191f960bed7077dec03416d8e075"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6026.0.0-darwin-arm64.tar.gz"
      sha256 "a32fdaba2762a093fcf0137b286322a70b66f1e6ba667269fc1ba3b8d2f17dec"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6026.0.0-linux-x64.tar.gz"
    sha256 "8894f292cab23d2a7a2095f6d380cebfa2383cbb91e65cfef64c59bcbacef2b7"
  end
  version "6026.0.0"
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
