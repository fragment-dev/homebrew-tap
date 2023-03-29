require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2310.0.0-darwin-x64.tar.gz"
    sha256 "29c495abbf786b738d4c270a3fe4436690e4316a7681a7a350981568b998d011"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2310.0.0-darwin-arm64.tar.gz"
      sha256 "4ddbbdeb07fc3cf8183da45120881fc3780436dafe945758043c6ba6d795534b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2310.0.0-linux-x64.tar.gz"
    sha256 "eecaa1973e552d56f8baeae9a03373f7cc2a836874935bb0acc0da235ac2607b"
  end
  version "2310.0.0"
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
