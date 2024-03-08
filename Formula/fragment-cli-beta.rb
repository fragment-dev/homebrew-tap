require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4729.0.0-darwin-x64.tar.gz"
    sha256 "077eb2db54f2f0f8b15d3fe0b1d4f190f628933ccc50d7e4b2789322085f54c2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4729.0.0-darwin-arm64.tar.gz"
      sha256 "b0ab6c6b2cc775865d82c1174541143f48ef0d9e4c024824bd1007303dd0b39b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4729.0.0-linux-x64.tar.gz"
    sha256 "59bf76ab5996af92f02c7c55d16007116eb19a32025ea349983799ff811a49b1"
  end
  version "4729.0.0"
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
