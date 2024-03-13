require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4763.0.0-darwin-x64.tar.gz"
    sha256 "c13a5ac513c98fa3ecec78ed6e9824abc76858cf7a4d4c461d1a0c12c429f9c4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4763.0.0-darwin-arm64.tar.gz"
      sha256 "2585fccf28e611256b4f8c386a9485cee5aaa9bb5faa86a9b649e48e96f298b3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4763.0.0-linux-x64.tar.gz"
    sha256 "67495782582ba40b6fea3df94d00641e9f0cd4771bdb4a69b4c5a1deac975d53"
  end
  version "4763.0.0"
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
