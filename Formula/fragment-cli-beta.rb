require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5367.0.0-darwin-x64.tar.gz"
    sha256 "3a5c80fb17c6c61c3c799a11a4ad40fa146b5b5a6e437bcd820e6f423394f08f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5367.0.0-darwin-arm64.tar.gz"
      sha256 "3e25b1be190639dd3b19e5df4fbdd30e40fa34fc4e83c5ab45093ed972f1e557"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5367.0.0-linux-x64.tar.gz"
    sha256 "523f3d3ce82e0920f3ac7b52fce7493bf4f4c7df38773417242df97d27e34d50"
  end
  version "5367.0.0"
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
