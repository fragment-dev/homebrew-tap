require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5257.0.0-darwin-x64.tar.gz"
    sha256 "1b29d06ea102879698fa0002c1d4ef0dbe24e67b9e8e01c343f9ecf18fda58fe"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5257.0.0-darwin-arm64.tar.gz"
      sha256 "653afb2cf2dafeb47b8e95f17fd21157e90f16d3a8def4e1d3e78701ce3a65f8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5257.0.0-linux-x64.tar.gz"
    sha256 "f1e5bfa6db91e2bb76b312ffa252ae16ff73f68a0272c7b57f9fe4c2c9694755"
  end
  version "5257.0.0"
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
