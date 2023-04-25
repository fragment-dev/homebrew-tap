require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2525.0.0-darwin-x64.tar.gz"
    sha256 "4b14f35158d0d181b09f805a6b4bc03d04b17b45a151b39ad6c299dddf066382"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2525.0.0-darwin-arm64.tar.gz"
      sha256 "5c2ae6fc20562c3965c76994d3a1411f0085950cbbe936c102a5f2dab77c4a66"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2525.0.0-linux-x64.tar.gz"
    sha256 "1c2bcc54bbf3f3b046024e70c92b49a5d903624f8c7765af302edabfd2dbb3cf"
  end
  version "2525.0.0"
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
