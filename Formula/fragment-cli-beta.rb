require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3149.0.0-darwin-x64.tar.gz"
    sha256 "5c279afbe4b4405051bcffc61994927f21160345e4c862075d2a6277ec7f207e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3149.0.0-darwin-arm64.tar.gz"
      sha256 "f0c02ece402b0be76c15b774712c1c64c9c1bf923b97003383d827b2a4e9fce2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3149.0.0-linux-x64.tar.gz"
    sha256 "36b1593c3781ff76e5abac241851b71381ac2d5b02ca867069868b0aea55aa31"
  end
  version "3149.0.0"
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
