require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2588.0.0-darwin-x64.tar.gz"
    sha256 "5344dcc53945f49ce01a96422a5b135f6fe89163f0ebc5fb6ee7af64a2407d61"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2588.0.0-darwin-arm64.tar.gz"
      sha256 "015389e71ba63abddac7bd1b757ea71a1f39a3b57f388092117c4bc9b52cea10"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2588.0.0-linux-x64.tar.gz"
    sha256 "c87e575c38cbad57c580500f63c2d1c22b4b48f74d866e07d5869d787e2329d0"
  end
  version "2588.0.0"
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
