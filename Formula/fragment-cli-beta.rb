require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5093.0.0-darwin-x64.tar.gz"
    sha256 "9b9f86ef513a318c30cc57fca29e75212365493a6c6e2310af854bb305c1b825"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5093.0.0-darwin-arm64.tar.gz"
      sha256 "900dcd62d80a354ed173668c45be1d432929d4b2cc4634cdfd83650de8cdfb08"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5093.0.0-linux-x64.tar.gz"
    sha256 "46e2ca5a1667b794bf181f592041c7b489a3cab2bd0b369e56bef3012118f688"
  end
  version "5093.0.0"
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
