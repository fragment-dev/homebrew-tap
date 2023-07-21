require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3143.0.0-darwin-x64.tar.gz"
    sha256 "bb38ea75ce314718fdcae8bc2226af8b2e28d6156976a66540a969521f26e91a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3143.0.0-darwin-arm64.tar.gz"
      sha256 "93a73b4493e69fee51794e4de7d85d844db4815d46cf3b820d4046af974f0321"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3143.0.0-linux-x64.tar.gz"
    sha256 "07576fd8ad10b27d098b4398c0f829dc949a6304d82022d4bd6f7f379ec123ba"
  end
  version "3143.0.0"
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
