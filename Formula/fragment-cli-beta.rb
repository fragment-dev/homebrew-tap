require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4721.0.0-darwin-x64.tar.gz"
    sha256 "44a2e2f7292df9a8a5047fd106766547e6d5d12ff427a8fa3248dc9b38aef1c2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4721.0.0-darwin-arm64.tar.gz"
      sha256 "195778e9bca4065e493781e1593b236344ca3e9d760bc4d7393f71b60493cec5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4721.0.0-linux-x64.tar.gz"
    sha256 "05020232b9f1a84c2e0796bdf9866b286852045222deb6ea161ef6cdb780ef3f"
  end
  version "4721.0.0"
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
