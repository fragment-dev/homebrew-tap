require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2479.0.0-darwin-x64.tar.gz"
    sha256 "e1a0e12d51b68f8a0df3d0cbaae0d8b814b9c12742156d0aa092d6eb68a001de"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2479.0.0-darwin-arm64.tar.gz"
      sha256 "cfe082a0b9c50178d02a8d10deba71195f7605cfa21d838cd3fe678e910ba55d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2479.0.0-linux-x64.tar.gz"
    sha256 "27ef40952fb8d777a00bc73b6daf8ff105aa57fb933d8d10545aa48bd0331f49"
  end
  version "2479.0.0"
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
