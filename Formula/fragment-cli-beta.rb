require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5663.0.0-darwin-x64.tar.gz"
    sha256 "3fc967848f4dbca65749b19a30831f3b8afa6af70bd01d4d6b493092d450093d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5663.0.0-darwin-arm64.tar.gz"
      sha256 "51abcdd9f83a076bd94a9abdfac9d21a1f5c25afc9c0c3c0f624fa3ac8a22851"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5663.0.0-linux-x64.tar.gz"
    sha256 "8dfc6c0a6468e284b43128120991bd41663d7bae83353442c909cf3db66a6270"
  end
  version "5663.0.0"
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
