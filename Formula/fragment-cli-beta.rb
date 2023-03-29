require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2305.0.0-darwin-x64.tar.gz"
    sha256 "4fb224754e1cc184634005f4b074220eb9e0697416d238bb22f977ea1c45bd28"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2305.0.0-darwin-arm64.tar.gz"
      sha256 "befd6e1c43b3c86822329688ceb5ff543a9363554d23cc67d97644f69581b8a2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2305.0.0-linux-x64.tar.gz"
    sha256 "043d2841992efe6a061e26b03965e2bf71cc785e98c266e440c76c0c6950c027"
  end
  version "2305.0.0"
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
