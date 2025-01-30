require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6141.0.0-darwin-x64.tar.gz"
    sha256 "3e5853ed8b6d6e05daffbce8fe6c381afa48f20e48ccfa9832e43116b55bd2cb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6141.0.0-darwin-arm64.tar.gz"
      sha256 "ca737d61c5d0cab870a712cac6596aea8b04a6b3084166909c529148a9a96085"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6141.0.0-linux-x64.tar.gz"
    sha256 "fb0dd9c160f82a377eb365688e5a5f0e7f684c82af18cedc9697149095148135"
  end
  version "6141.0.0"
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
