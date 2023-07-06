require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3015.0.0-darwin-x64.tar.gz"
    sha256 "c235c1030a5ede3c5ab7e7dcd502fff688a7d81654b39b2ef7734004bcc1ed93"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3015.0.0-darwin-arm64.tar.gz"
      sha256 "c71a55b91b1d9b72dd8bef70b49fa2ef3385942c9c4e1958ebbe9f79b9025444"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3015.0.0-linux-x64.tar.gz"
    sha256 "bc57cbdd05a59711eacb13e8b50e5fe3a3936ac6739132638b8e1af4e6f40bb3"
  end
  version "3015.0.0"
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
