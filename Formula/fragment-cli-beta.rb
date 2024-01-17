require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4357.0.0-darwin-x64.tar.gz"
    sha256 "cb37e6f8dbb6b9e0101cd6ed176aff588f5a4ce4b9315d1074c57645f621f623"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4357.0.0-darwin-arm64.tar.gz"
      sha256 "e660c06de2dc7b7a77dfbdfaa42d7f78cd9b7740acc36f655245b011f7319b7e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4357.0.0-linux-x64.tar.gz"
    sha256 "19586f7b76253418ae9f4f0c1c00a520a652716ba9f0dbf14b10e56d54b365d5"
  end
  version "4357.0.0"
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
