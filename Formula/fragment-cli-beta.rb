require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6127.0.0-darwin-x64.tar.gz"
    sha256 "66e650a11962d649bb1440b0bd7c349f54be5da90f9ba329e37b18a0f75f2962"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6127.0.0-darwin-arm64.tar.gz"
      sha256 "b4b365ff48d923592ecf19095dfb668edbe2f918d715c8b593793a0c086094b5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6127.0.0-linux-x64.tar.gz"
    sha256 "ce0cd4c9271faaf44d323d871f49dfbb53056bdd13b6012f40b0f23d14fcad04"
  end
  version "6127.0.0"
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
