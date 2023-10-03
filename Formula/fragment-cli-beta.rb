require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3757.0.0-darwin-x64.tar.gz"
    sha256 "3fce406548cb23bca2a8ee28e3afc749e9b776582c6327878ff3092d479204f7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3757.0.0-darwin-arm64.tar.gz"
      sha256 "b52be82a561715a8014039dc09f35beff53affad3eec0065607bc61db2a12ee2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3757.0.0-linux-x64.tar.gz"
    sha256 "238744f027c77d4f991e1ce0d8936ca9b3238cddd6d0eb7d4cd3b96d3902e1de"
  end
  version "3757.0.0"
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
