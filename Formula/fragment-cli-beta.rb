require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6017.0.0-darwin-x64.tar.gz"
    sha256 "1b4e33f1e009e83383df68f66320044eaea4c64682ebba7837a097488aaf5b32"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6017.0.0-darwin-arm64.tar.gz"
      sha256 "8c1a1c9e1161d11f7e8419b274c90065b6d53ce9300f010928fdc525f478814e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6017.0.0-linux-x64.tar.gz"
    sha256 "6aac0ad66c9dba7582c27a3283d8aa32d79db97d582a27d9f6c0e2d3dae41e73"
  end
  version "6017.0.0"
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
