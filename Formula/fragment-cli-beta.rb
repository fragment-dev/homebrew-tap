require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4706.0.0-darwin-x64.tar.gz"
    sha256 "8700f401ff0f4dc02908890536dc60f88520209b83ea4b52b760622c7de5051b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4706.0.0-darwin-arm64.tar.gz"
      sha256 "a9dbc785018f95055a723a5deaddbcc73a59005afc3f3c76218994d5174f5655"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4706.0.0-linux-x64.tar.gz"
    sha256 "9547c12d6b99678cfa72a773042bbea82907cf028e573191c71facd04fe47c08"
  end
  version "4706.0.0"
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
