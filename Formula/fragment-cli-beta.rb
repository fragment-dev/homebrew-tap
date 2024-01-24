require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4420.0.0-darwin-x64.tar.gz"
    sha256 "617239a8da43371e070311fe149f440803eb123ab72f210e182a225e4ba47f88"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4420.0.0-darwin-arm64.tar.gz"
      sha256 "4af015616ccc1ac17b0934fb710369a1113ada4a9c50ee4715ea617a87de8b4b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4420.0.0-linux-x64.tar.gz"
    sha256 "bb4a3f113bae874cc1af65f6b6e343794cf6efa94bb73a33946bf76425a87b7f"
  end
  version "4420.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
